import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_dropdown.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_image_button.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditChildProfilePage extends StatefulWidget {
  const EditChildProfilePage({Key? key}) : super(key: key);

  @override
  State<EditChildProfilePage> createState() => _EditChildProfilePageState();
}

class _EditChildProfilePageState extends State<EditChildProfilePage> {
  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Edit Child Profile Page"),
            flexibleSpace: const GradientBackground()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CustomTextField(
                  state: "",
                  label: "Név:",
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
                const CustomTextField(
                  state: "",
                  label: "Bemutatkozás:",
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
