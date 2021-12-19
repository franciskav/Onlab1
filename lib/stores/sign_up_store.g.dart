// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStore, Store {
  final _$emailAtom = Atom(name: '_SignUpStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordAgainAtom = Atom(name: '_SignUpStore.passwordAgain');

  @override
  String get passwordAgain {
    _$passwordAgainAtom.reportRead();
    return super.passwordAgain;
  }

  @override
  set passwordAgain(String value) {
    _$passwordAgainAtom.reportWrite(value, super.passwordAgain, () {
      super.passwordAgain = value;
    });
  }

  final _$emailErrorAtom = Atom(name: '_SignUpStore.emailError');

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  final _$passwordErrorAtom = Atom(name: '_SignUpStore.passwordError');

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  final _$passwordAgainErrorAtom =
      Atom(name: '_SignUpStore.passwordAgainError');

  @override
  String? get passwordAgainError {
    _$passwordAgainErrorAtom.reportRead();
    return super.passwordAgainError;
  }

  @override
  set passwordAgainError(String? value) {
    _$passwordAgainErrorAtom.reportWrite(value, super.passwordAgainError, () {
      super.passwordAgainError = value;
    });
  }

  final _$signUpAsyncAction = AsyncAction('_SignUpStore.signUp');

  @override
  Future<void> signUp(
      {required void Function(MyUser.User) onSuccess,
      required void Function(String) onError}) {
    return _$signUpAsyncAction
        .run(() => super.signUp(onSuccess: onSuccess, onError: onError));
  }

  final _$signUpWithGoogleAsyncAction =
      AsyncAction('_SignUpStore.signUpWithGoogle');

  @override
  Future<void> signUpWithGoogle(
      {required void Function(MyUser.User) onSuccess,
      required void Function(String) onError}) {
    return _$signUpWithGoogleAsyncAction.run(
        () => super.signUpWithGoogle(onSuccess: onSuccess, onError: onError));
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordAgain: ${passwordAgain},
emailError: ${emailError},
passwordError: ${passwordError},
passwordAgainError: ${passwordAgainError}
    ''';
  }
}
