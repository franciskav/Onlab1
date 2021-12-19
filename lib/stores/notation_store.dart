import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:onlab1/enums/parent_gender.dart';
import 'package:onlab1/enums/select_child_gender.dart';
import 'package:onlab1/enums/select_parent_gender.dart';
import 'package:onlab1/models/child.dart';
import 'package:onlab1/models/filter.dart';
import 'package:onlab1/models/user.dart';

part 'notation_store.g.dart';

class NotationStore = _NotationStore with _$NotationStore;

abstract class _NotationStore with Store {
  @observable
  List<User> filteredUsers = [];

  @observable
  List<User> allUser = [];

  @observable
  List<String> friends = [];

  @observable
  List<String> rejected = [];

  @computed
  User? get filteredUser {
    if (filteredUsers.isEmpty) {
      return null;
    }
    return filteredUsers.first;
  }

  @action
  Future<void> accept(String myId, String id, void Function() onSuccess,
      void Function(String) onError) async {
    try {
      await FirebaseDatabase.instance.ref('friends/${DateTime.now().millisecondsSinceEpoch}').set(<String, dynamic>{
        'sender': myId,
        'host': id,
      });
      onSuccess();
    } catch (e) {
      onError('Hiba történt, próbálja meg újra');
    }
  }

  @action
  Future<void> reject(String myId, String id, void Function() onSuccess,
      void Function(String) onError) async {
    try {
      await FirebaseDatabase.instance.ref('rejected/${DateTime.now().millisecondsSinceEpoch}').set(<String, dynamic>{
        'sender': myId,
        'host': id,
      });
      onSuccess();
    } catch (e) {
      onError('Hiba történt, próbálja meg újra');
    }
  }

  @action
  Future<void> getFilteredUsers(String uid, Filter filter) async {
    print(uid);
    filteredUsers = [];
    allUser = [];
    friends = [];
    rejected = [];
    await getAllUser(uid);
    await getFriends(uid);
    await getRejected(uid);
    print('friends: $friends');
    print('rejected: $rejected');
    allUser.forEach((user) {
      bool add = true;
      if (friends.contains(user.id) ||
          rejected.contains(user.id) ||
          user.id == uid ||
          !isParentGenderRight(user.gender!, filter.parentGender!) ||
          !isChildrenGenderRight(user.children!, filter.childrenGender!) ||
          !isParentAgeRight(
              user.birthDate!, filter.parentMinAge!, filter.parentMaxAge!) ||
          !isChildrenAgeRight(
              user.children!, filter.childrenMinAge!, filter.childrenMaxAge!)) {
        add = false;
      }
      if (add) {
        print('inForEach: ${user.id}, ${user.email}, ${user.name}');
        filteredUsers.add(user);
      }
    });
    print('filteredUsers: $filteredUsers');
  }

  bool isParentGenderRight(ParentGender gender, SelectParentGender filter) {
    if (filter == SelectParentGender.any) {
      return true;
    } else if (describeEnum(gender) == describeEnum(filter)) {
      return true;
    }
    return false;
  }

  bool isChildrenGenderRight(List<Child> children, SelectChildGender filter) {
    bool isRight = false;
    if (filter == SelectChildGender.any) {
      isRight = true;
    } else {
      children.forEach((child) {
        if (describeEnum(child.gender!) == describeEnum(filter)) {
          isRight = true;
        }
      });
    }
    return isRight;
  }

  bool isParentAgeRight(DateTime dateOfBirt, int min, int max) {
    DateTime maxDate = DateTime.now().subtract(Duration(days: min * 365));
    DateTime minDate = DateTime.now().subtract(Duration(days: max * 365));
    if (dateOfBirt.isAfter(minDate) && dateOfBirt.isBefore(maxDate)) {
      return true;
    }
    return false;
  }

  bool isChildrenAgeRight(List<Child> children, int min, int max) {
    bool isRight = false;
    DateTime maxDate = DateTime.now().subtract(Duration(days: min * 365));
    DateTime minDate = DateTime.now().subtract(Duration(days: max * 365));
    children.forEach((child) {
      if (child.birthDate!.isAfter(minDate) &&
          child.birthDate!.isBefore(maxDate)) {
        isRight = true;
      }
    });
    return isRight;
  }

  Future<void> getAllUser(String uid) async {
    try {
      DataSnapshot snapshot =
          await FirebaseDatabase.instance.ref('/users').get();
      Map<String, dynamic> mappedValue =
          Map<String, dynamic>.from(snapshot.value as Map);
      var userList = mappedValue.entries.map((e) {
        return Map<String, dynamic>.from(e.value as Map)['data'];
      }).toList();
      allUser = userList
          .map((e) => User.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getFriends(String uid) async {
    try {
      DataSnapshot snapshot = await FirebaseDatabase.instance
          .ref('/friends')
          .orderByChild("sender")
          .equalTo(uid)
          .get();
      List<dynamic> list = [];
      if (snapshot.value is Map) {
        Map<String, dynamic> mappedValue =
            Map<String, dynamic>.from(snapshot.value as Map);
        list = mappedValue.values.toList();
      } else {
        list = snapshot.value as List<dynamic>;
      }
      friends = list.map((e) {
        return e['host'] as String;
      }).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRejected(String uid) async {
    try {
      DataSnapshot snapshot = await FirebaseDatabase.instance
          .ref('/rejected')
          .orderByChild("sender")
          .equalTo(uid)
          .get();
      List<dynamic> list = [];
      if (snapshot.value is Map) {
        Map<String, dynamic> mappedValue =
            Map<String, dynamic>.from(snapshot.value as Map);
        list = mappedValue.values.toList();
      } else {
        list = snapshot.value as List<dynamic>;
      }
      rejected = list.map((e) {
        return e['host'] as String;
      }).toList();
    } catch (e) {
      print(e);
    }
  }
}
