import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String? emailError;

  @observable
  String? passwordError;

  @action
  Future<void> login(
      {required void Function() onSuccess,
      required void Function(String) onError}) async {
    if (!validate()) {
      return;
    }

    print('LOGIN ${email} ${password}');

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      String error = "";
      if (e.code == 'user-not-found') {
        error = 'Nem található felhasználó a megadott email címmel';
      } else if (e.code == 'wrong-password') {
        error = 'Hibás jelszó';
      }
      onError(error);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> loginWithGoogle({required void Function() onSuccess,
    required void Function(String) onError}) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    FirebaseAuth.instance.signInWithCredential(credential);
  }

  @action
  Future<void> loginWithFacebook({required void Function() onSuccess,
    required void Function(String) onError}) async {
    final LoginResult loginResult =
        FacebookAuth.instance.login() as LoginResult;
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  bool validate() {
    bool valid = true;

    if (email.isEmpty) {
      emailError = "A mező kitöltése kötelező";
      valid = false;
    } else if (!isEmail(email)) {
      emailError = "Nem megfelelő formátumú email cím";
      valid = false;
    } else {
      emailError = null;
    }

    if (password.isEmpty) {
      passwordError = "A mező kitöltése kötelező";
    } else {
      passwordError = null;
    }

    return valid;
  }
}
