import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_text_button.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/route_names.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text("App név"),
          toolbarHeight: 150.h,
          titleTextStyle: Theme.of(context).textTheme.headline1,
          flexibleSpace: const GradientBackground()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
              const CustomTextField(
                state: "",
                label: "Email:",
                textInputType: TextInputType.emailAddress,
                multiLine: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomTextField(
                state: "",
                label: "Jelszó:",
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomElevatedButton(
                text: "Bejelentkezés",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.main);
                },
                disabled: false,
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2.h,
                      color: const Color.fromRGBO(142, 142, 142, 1.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      "vagy",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2.h,
                      color: const Color.fromRGBO(142, 142, 142, 1.0),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                      onPressed: () {}, type: Type.facebook, disabled: false),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomIconButton(
                      onPressed: () {}, type: Type.google, disabled: false),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                "Még nincs fiókod?",
                style: Theme.of(context).textTheme.caption,
              ),
              CustomTextButton(
                  text: "Regisztrájl",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signup);
                  }),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
