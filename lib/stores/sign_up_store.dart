import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
part 'sign_up_store.g.dart';

//facebook redirect https://onlab1.firebaseapp.com/__/auth/handler

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String passwordAgain = '';

  @observable
  String? emailError;

  @observable
  String? passwordError;

  @observable
  String? passwordAgainError;

  @action
  Future<void> signUp(
      {required void Function() onSuccess,
      required void Function(String) onError}) async {
    if (!validate()) {
      return;
    }

    print('SIGNUP ${email} ${password} ${passwordAgain}');

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      String error = "";
      if (e.code == 'weak-password') {
        error = 'Gyenge jelszó';
      } else if (e.code == 'email-already-in-use') {
        error = 'A megadott email cím már használatban van';
      }
      onError(error);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> signUpWithGoogle({required void Function() onSuccess,
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
  Future<void> signUpWithFacebook({required void Function() onSuccess,
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

    if (passwordAgain.isEmpty) {
      passwordAgainError = "A mező kitöltése kötelező";
    } else if (password != passwordAgain) {
      passwordAgainError = "A két jelszó nem egyforma";
    } else {
      passwordAgainError = null;
    }

    return valid;
  }
}
