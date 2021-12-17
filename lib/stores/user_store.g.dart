// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<String>? _$tempDateOfBirthComputed;

  @override
  String get tempDateOfBirth => (_$tempDateOfBirthComputed ??= Computed<String>(
          () => super.tempDateOfBirth,
          name: '_UserStore.tempDateOfBirth'))
      .value;
  Computed<String>? _$tempChildDateOfBirthComputed;

  @override
  String get tempChildDateOfBirth => (_$tempChildDateOfBirthComputed ??=
          Computed<String>(() => super.tempChildDateOfBirth,
              name: '_UserStore.tempChildDateOfBirth'))
      .value;
  Computed<ObservableList<Child>>? _$getChildrenComputed;

  @override
  ObservableList<Child> get getChildren => (_$getChildrenComputed ??=
          Computed<ObservableList<Child>>(() => super.getChildren,
              name: '_UserStore.getChildren'))
      .value;
  Computed<String>? _$getUserAgeComputed;

  @override
  String get getUserAge =>
      (_$getUserAgeComputed ??= Computed<String>(() => super.getUserAge,
              name: '_UserStore.getUserAge'))
          .value;
  Computed<String>? _$getUserGenderComputed;

  @override
  String get getUserGender =>
      (_$getUserGenderComputed ??= Computed<String>(() => super.getUserGender,
              name: '_UserStore.getUserGender'))
          .value;
  Computed<String>? _$getUserIntroductionComputed;

  @override
  String get getUserIntroduction => (_$getUserIntroductionComputed ??=
          Computed<String>(() => super.getUserIntroduction,
              name: '_UserStore.getUserIntroduction'))
      .value;

  final _$userAtom = Atom(name: '_UserStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$tempUserAtom = Atom(name: '_UserStore.tempUser');

  @override
  User get tempUser {
    _$tempUserAtom.reportRead();
    return super.tempUser;
  }

  @override
  set tempUser(User value) {
    _$tempUserAtom.reportWrite(value, super.tempUser, () {
      super.tempUser = value;
    });
  }

  final _$tempChildAtom = Atom(name: '_UserStore.tempChild');

  @override
  Child get tempChild {
    _$tempChildAtom.reportRead();
    return super.tempChild;
  }

  @override
  set tempChild(Child value) {
    _$tempChildAtom.reportWrite(value, super.tempChild, () {
      super.tempChild = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_UserStore.getUser');

  @override
  Future<void> getUser(String uid) {
    return _$getUserAsyncAction.run(() => super.getUser(uid));
  }

  final _$updateUserAsyncAction = AsyncAction('_UserStore.updateUser');

  @override
  Future<void> updateUser(
      void Function() onSuccess, void Function(String) onError) {
    return _$updateUserAsyncAction
        .run(() => super.updateUser(onSuccess, onError));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void initTempUser() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.initTempUser');
    try {
      return super.initTempUser();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewUSer(User newUser) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setNewUSer');
    try {
      return super.setNewUSer(newUser);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTempUser(
      {String? name,
      DateTime? birthDate,
      ParentGender? gender,
      List<Child>? children,
      String? introduction,
      String? photo}) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setTempUser');
    try {
      return super.setTempUser(
          name: name,
          birthDate: birthDate,
          gender: gender,
          children: children,
          introduction: introduction,
          photo: photo);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initTempChild() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.initTempChild');
    try {
      return super.initTempChild();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTempChild(
      {String? name,
      DateTime? birthDate,
      ChildGender? gender,
      List<Child>? children,
      String? introduction}) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setTempChild');
    try {
      return super.setTempChild(
          name: name,
          birthDate: birthDate,
          gender: gender,
          children: children,
          introduction: introduction);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateChild(void Function() onSuccess, void Function(String) onError) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updateChild');
    try {
      return super.updateChild(onSuccess, onError);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
tempUser: ${tempUser},
tempChild: ${tempChild},
tempDateOfBirth: ${tempDateOfBirth},
tempChildDateOfBirth: ${tempChildDateOfBirth},
getChildren: ${getChildren},
getUserAge: ${getUserAge},
getUserGender: ${getUserGender},
getUserIntroduction: ${getUserIntroduction}
    ''';
  }
}
