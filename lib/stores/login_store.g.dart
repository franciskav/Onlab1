// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$emailAtom = Atom(name: '_LoginStore.email');

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

  final _$passwordAtom = Atom(name: '_LoginStore.password');

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

  final _$emailErrorAtom = Atom(name: '_LoginStore.emailError');

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

  final _$passwordErrorAtom = Atom(name: '_LoginStore.passwordError');

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

  final _$loginAsyncAction = AsyncAction('_LoginStore.login');

  @override
  Future<void> login(
      {required void Function(String) onSuccess,
      required void Function(String) onError}) {
    return _$loginAsyncAction
        .run(() => super.login(onSuccess: onSuccess, onError: onError));
  }

  final _$loginWithGoogleAsyncAction =
      AsyncAction('_LoginStore.loginWithGoogle');

  @override
  Future<void> loginWithGoogle(
      {required void Function(String) onSuccess,
      required void Function(String) onError}) {
    return _$loginWithGoogleAsyncAction.run(
        () => super.loginWithGoogle(onSuccess: onSuccess, onError: onError));
  }

  final _$logoutAsyncAction = AsyncAction('_LoginStore.logout');

  @override
  Future<void> logout({required void Function() onSignedOut}) {
    return _$logoutAsyncAction
        .run(() => super.logout(onSignedOut: onSignedOut));
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
emailError: ${emailError},
passwordError: ${passwordError}
    ''';
  }
}
