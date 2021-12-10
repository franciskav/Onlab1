import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_text_button.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/route_names.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        flexibleSpace: const GradientBackground(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.editProfile);
            },
            icon: const Icon(Icons.edit_outlined),
            iconSize: 45.h,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[],
          ),
        ),
      ),
    );
  }
}
