import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_dropdown.dart';
import 'package:onlab1/components/button/custom_image_button.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/enums/child_gender.dart';
import 'package:onlab1/stores/user_store.dart';
import 'package:provider/provider.dart';

class EditChildProfilePage extends StatefulWidget {
  const EditChildProfilePage({Key? key}) : super(key: key);

  @override
  State<EditChildProfilePage> createState() => _EditChildProfilePageState();
}

class _EditChildProfilePageState extends State<EditChildProfilePage> {
  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void onSavePress(UserStore _userStore) {
    _userStore.updateChild(() {
      Navigator.pop(context);
    }, (error) {
      showSnackBar(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final L10n? l10n = L10n.of(context);

    final Map<String, TextEditingController> _textControllers = {
      "name": TextEditingController(text: _userStore.tempChild.name),
      "introduction":
          TextEditingController(text: _userStore.tempChild.introduction),
    };

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(l10n!.editChildProfilePage),
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
                      _userStore.setTempChild(name: value);
                    },
                    controller: _textControllers["name"]!,
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                Observer(builder: (_) {
                  return CustomImageButton(
                    text: _userStore.tempChildDateOfBirth,
                    onPressed: () async {
                      DateTime? selected = await showDatePicker(
                          context: context,
                          initialDate:
                              _userStore.tempChild.birthDate ?? DateTime.now(),
                          firstDate: DateTime(2000, 1, 1),
                          lastDate: DateTime.now());
                      if (selected != null) {
                        _userStore.setTempChild(birthDate: selected);
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
                    items: ChildGender.values,
                    label: l10n.gender,
                    onChanged: (value) {
                      _userStore.setTempChild(gender: value as ChildGender);
                    },
                    value: _userStore.tempChild.gender,
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                Observer(builder: (_) {
                  return CustomTextField(
                    label: l10n.introduction,
                    onChanged: (value) {
                      setState(() {
                        _userStore.setTempChild(introduction: value);
                      });
                    },
                    controller: _textControllers["introduction"]!,
                    multiLine: true,
                  );
                }),
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
