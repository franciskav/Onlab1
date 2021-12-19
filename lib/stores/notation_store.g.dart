// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotationStore on _NotationStore, Store {
  final _$allUserAtom = Atom(name: '_NotationStore.allUser');

  @override
  List<User> get allUser {
    _$allUserAtom.reportRead();
    return super.allUser;
  }

  @override
  set allUser(List<User> value) {
    _$allUserAtom.reportWrite(value, super.allUser, () {
      super.allUser = value;
    });
  }

  final _$friendsAtom = Atom(name: '_NotationStore.friends');

  @override
  List<String> get friends {
    _$friendsAtom.reportRead();
    return super.friends;
  }

  @override
  set friends(List<String> value) {
    _$friendsAtom.reportWrite(value, super.friends, () {
      super.friends = value;
    });
  }

  final _$rejectedAtom = Atom(name: '_NotationStore.rejected');

  @override
  List<String> get rejected {
    _$rejectedAtom.reportRead();
    return super.rejected;
  }

  @override
  set rejected(List<String> value) {
    _$rejectedAtom.reportWrite(value, super.rejected, () {
      super.rejected = value;
    });
  }

  final _$getUsersAsyncAction = AsyncAction('_NotationStore.getUsers');

  @override
  Future<void> getFilteredUsers(String uid, Filter filter) {
    return _$getUsersAsyncAction.run(() => super.getFilteredUsers(uid, filter));
  }

  @override
  String toString() {
    return '''
allUser: ${allUser},
friends: ${friends},
rejected: ${rejected}
    ''';
  }
}
