import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_dropdown.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_image_button.dart';
import 'package:onlab1/components/button/custom_text_button.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/route_names.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final Map<String, TextEditingController> _textControllers = {
    "name": TextEditingController(),
    "introduction": TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Edit Profile Page"),
            flexibleSpace: const GradientBackground()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextField(
                  label: "Név:",
                  onChanged: (value) {},
                  controller: _textControllers["name"]!,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomImageButton(
                  text: "1986.04.22",
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950, 1, 1),
                        lastDate: DateTime.now());
                  },
                  icon: Icons.calendar_today_outlined,
                  disabled: false,
                  label: "Születési dátum:",
                ),
                SizedBox(
                  height: 10.h,
                ),
                const CustomDropdown(items: ['Nő', 'Férfi'], label: "Nem:"),
                SizedBox(
                  height: 10.h,
                ),
                CustomImageButton(
                  text: "Gyerek1",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.editChildProfile);
                  },
                  icon: Icons.edit_outlined,
                  disabled: false,
                  label: "Gyerekek:",
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomImageButton(
                  text: "Gyerek2",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.editChildProfile);
                  },
                  icon: Icons.edit_outlined,
                  disabled: false,
                  //label: "Gyerekek:",
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomIconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.editChildProfile);
                    },
                    type: Type.plus),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  label: "Bemutatkozás:",
                  onChanged: (value) {},
                  controller: _textControllers["introduction"]!,
                  multiLine: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomElevatedButton(
                    text: "Mentés", onPressed: () {}, disabled: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
