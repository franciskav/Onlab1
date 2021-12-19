import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:onlab1/models/user.dart' as MyUser;
import 'package:onlab1/stores/user_store.dart';
import 'package:validators/validators.dart';
part 'sign_up_store.g.dart';

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
      {required void Function(MyUser.User) onSuccess,
      required void Function(String) onError}) async {
    if (!validate()) {
      return;
    }

    print('SIGNUP ${email} ${password} ${passwordAgain}');

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      if (userCredential.user?.uid != null &&
          userCredential.user?.email != null) {
        MyUser.User user = MyUser.User(
            id: userCredential.user!.uid,
            email: userCredential.user!.email,
            children: []);
        onSuccess(user);
      }
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
  Future<void> signUpWithGoogle(
      {required void Function(MyUser.User) onSuccess,
      required void Function(String) onError}) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential);
      if (userCredential.user?.uid != null &&
          userCredential.user?.email != null) {
        MyUser.User user = MyUser.User(
            id: userCredential.user!.uid,
            email: userCredential.user!.email,
            children: []);
        onSuccess(user);
      }
    } on FirebaseAuthException catch (e) {
      onError('Váratlan hiba történt');
    } catch (e) {
      print(e);
    }
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
      valid = false;
    } else {
      passwordError = null;
    }

    if (passwordAgain.isEmpty) {
      passwordAgainError = "A mező kitöltése kötelező";
      valid = false;
    } else if (password != passwordAgain) {
      passwordAgainError = "A két jelszó nem egyforma";
      valid = false;
    } else {
      passwordAgainError = null;
    }

    return valid;
  }
}
