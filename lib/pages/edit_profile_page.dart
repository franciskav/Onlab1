import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_dropdown.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_image_button.dart';
import 'package:onlab1/components/picker/custom_image_picker.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/route_names.dart';
import 'package:onlab1/enums/parent_gender.dart';
import 'package:onlab1/models/child.dart';
import 'package:onlab1/stores/user_store.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  FutureOr onGoBack(UserStore _userStore) {
    _userStore.setTempUser();
    setState(() {});
  }

  void onSavePress(UserStore _userStore) {
    _userStore.updateUser((error) {
      showSnackBar(error);
    });
    setState(() {});
  }

  Widget listChildren(ObservableList<Child> children, UserStore _userStore) {
    return Observer(
      builder: (_) {
        return ListView.builder(
            itemCount: children.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: CustomImageButton(
                  key: Key(index.toString()),
                  text: children[index].name!,
                  onPressed: () {
                    _userStore.childIndex = index;
                    Navigator.pushNamed(context, Routes.editChildProfile)
                        .then((_) => onGoBack(_userStore));
                    _userStore.initTempChild();
                  },
                  icon: Icons.edit_outlined,
                ),
              );
            });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final L10n? l10n = L10n.of(context);

    final Map<String, TextEditingController> _textControllers = {
      "name": TextEditingController(text: _userStore.tempUser.name),
      "introduction":
          TextEditingController(text: _userStore.tempUser.introduction),
    };

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(l10n!.editProfile),
            flexibleSpace: const GradientBackground()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Observer(builder: (_) {
                  return CustomTextField(
                    label: l10n.name,
                    onChanged: (value) {
                      _userStore.setTempUser(name: value);
                    },
                    controller: _textControllers["name"]!,
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                Observer(builder: (_) {
                  return CustomImageButton(
                    text: _userStore.tempDateOfBirth,
                    onPressed: () async {
                      DateTime? selected = await showDatePicker(
                          context: context,
                          initialDate:
                              _userStore.tempUser.birthDate ?? DateTime.now(),
                          firstDate: DateTime(1950, 1, 1),
                          lastDate: DateTime.now());
                      if (selected != null) {
                        _userStore.setTempUser(birthDate: selected);
                      }
                    },
                    icon: Icons.calendar_today_outlined,
                    disabled: false,
                    label: l10n.dateOfBirth,
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                Observer(builder: (_) {
                  return CustomDropdown(
                    items: ParentGender.values,
                    label: l10n.gender,
                    onChanged: (value) {
                      _userStore.setTempUser(gender: value as ParentGender);
                    },
                    value: _userStore.tempUser.gender,
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  l10n.kids.toUpperCase(),
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 10.h,
                ),
                listChildren(_userStore.getChildren, _userStore),
                SizedBox(
                  height: 10.h,
                ),
                CustomIconButton(
                    onPressed: () {
                      _userStore.childIndex = -1;
                      Navigator.pushNamed(context, Routes.editChildProfile);
                      _userStore.initTempChild();
                    },
                    type: Type.plus),
                SizedBox(
                  height: 10.h,
                ),
                Observer(builder: (_) {
                  return CustomTextField(
                    label: l10n.introduction,
                    onChanged: (value) {
                      _userStore.setTempUser(introduction: value);
                    },
                    controller: _textControllers["introduction"]!,
                    multiLine: true,
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                Observer(
                  builder: (_) {
                    return CustomImagePicker(
                      label: 'Fotó',
                      value: _userStore.tempUser.photo,
                      onChanged: (value) {
                        _userStore.setTempUser(photo: value);
                      },
                    );
                  }
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomElevatedButton(
                    text: l10n.save,
                    onPressed: () {
                      onSavePress(_userStore);
                    },
                    disabled: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
