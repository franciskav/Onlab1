import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:onlab1/enums/child_gender.dart';
import 'package:onlab1/enums/parent_gender.dart';
import 'package:onlab1/models/child.dart';
import 'package:onlab1/models/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User user = User();

  @observable
  User tempUser = User();

  @observable
  Child tempChild = Child();

  int childIndex = -1;

  @computed
  String get tempDateOfBirth {
    return tempUser.birthDate != null
        ? DateFormat('yyyy.MM.dd').format(tempUser.birthDate!)
        : "";
  }

  @computed
  String get tempChildDateOfBirth {
    return tempChild.birthDate != null
        ? DateFormat('yyyy.MM.dd').format(tempChild.birthDate!)
        : "";
  }

  @computed
  ObservableList<Child> get getChildren {
    ObservableList<Child> observables = ObservableList();
    observables.addAll(tempUser.children ?? []);
    return observables;
  }

  @action
  void initTempUser() {
    tempUser = user;
  }

  @action
  void setNewUSer(User newUser) {
    user = newUser;
    print('NEW_USER ${newUser.id}, ${newUser.email}');
  }

  @action
  void setTempUser(
      {String? name,
      DateTime? birthDate,
      ParentGender? gender,
      List<Child>? children,
      String? introduction,
      String? photo}) {
    tempUser = User(
      id: tempUser.id,
      email: tempUser.email,
      name: name ?? tempUser.name,
      birthDate: birthDate ?? tempUser.birthDate,
      gender: gender ?? tempUser.gender,
      children: children ?? tempUser.children,
      introduction: introduction ?? tempUser.introduction,
      photo: photo ?? tempUser.photo,
    );
  }

  @action
  void initTempChild() {
    if (childIndex < 0) {
      tempChild = Child();
    } else {
      Child _child = tempUser.children![childIndex];
      tempChild = Child(
          name: _child.name,
          birthDate: _child.birthDate,
          gender: _child.gender,
          introduction: _child.introduction);
    }
  }

  @action
  void setTempChild(
      {String? name,
      DateTime? birthDate,
      ChildGender? gender,
      List<Child>? children,
      String? introduction}) {
    tempChild = Child(
      name: name ?? tempChild.name,
      birthDate: birthDate ?? tempChild.birthDate,
      gender: gender ?? tempChild.gender,
      introduction: introduction ?? tempChild.introduction,
    );
  }

  @action
  void updateChild(void Function(String) onError) {
    print(tempChild.toJson());
    print(tempUser.toJson());
    if (validateChild(tempChild)) {
      if (childIndex < 0) {
        tempUser.children!.add(tempChild);
      } else {
        tempUser.children![childIndex] = tempChild;
      }
    } else {
      onError('Minden mező kitöltése kötelező');
    }
  }

  @action
  void getUser() {
    //TODO: load data from Firebase
  }

  @action
  Future<void> updateUser(void Function(String) onError) async {
    print(tempUser.toJson());
    if (validateUser(tempUser)) {
      File file = File(tempUser.photo!);
      String fileName = tempUser.photo!.split('/').last;
      try {
        await FirebaseStorage.instance.ref('photos/$fileName').putFile(file);
        String downloadUrl = await FirebaseStorage.instance
            .ref('photos/$fileName')
            .getDownloadURL();
        setTempUser(photo: downloadUrl);
        user = tempUser;
        print('USER ${tempUser.toJson()}');
        await FirebaseDatabase.instance
            .ref('users/${user.id}/data')
            .set(user.toJson());
      } on FirebaseException catch (e) {
        print(e);
      }
      //TODO: update user in Firebase
    } else {
      onError('Minden mező kitöltése kötelező');
    }
  }

  bool validateUser(User editedUser) {
    bool valid = true;

    if (editedUser.id == null) {
      valid = false;
    }
    if (editedUser.email == null) {
      valid = false;
    }
    if (editedUser.name == null) {
      valid = false;
    }
    if (editedUser.birthDate == null) {
      valid = false;
    }
    if (editedUser.gender == null) {
      valid = false;
    }
    if (editedUser.children == null) {
      valid = false;
    }
    if (editedUser.introduction == null) {
      valid = false;
    }
    if (editedUser.photo == null) {
      valid = false;
    }

    return valid;
  }

  bool validateChild(Child editedUser) {
    bool valid = true;

    if (editedUser.name == null) {
      valid = false;
    }
    if (editedUser.birthDate == null) {
      valid = false;
    }
    if (editedUser.gender == null) {
      valid = false;
    }
    if (editedUser.introduction == null) {
      valid = false;
    }

    return valid;
  }
}
