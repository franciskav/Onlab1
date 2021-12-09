import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_dropdown.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/slider/custom_range_slider.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/config/theme_config.dart';
import 'package:onlab1/pages/chat_page.dart';
import 'package:onlab1/pages/child_profile_page.dart';
import 'package:onlab1/pages/edit_child_profile_page.dart';
import 'package:onlab1/pages/edit_profile_page.dart';
import 'package:onlab1/pages/login_page.dart';
import 'package:onlab1/pages/main_page.dart';
import 'package:onlab1/pages/profile_page.dart';
import 'package:onlab1/pages/sign_up_page.dart';

import 'components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/button/custom_image_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: () => MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeConfig.createTheme(),
              localizationsDelegates: L10n.localizationsDelegates,
              supportedLocales: L10n.supportedLocales,
              home: const LoginPage(),
              routes: {
                "/login_page": (context) => LoginPage(),
                "/signup_page": (context) => SignUpPage(),
                "/main_page": (context) => MainPage(),
                "/profile_page": (context) => ProfilePage(),
                "/edit_profile_page": (context) => EditProfilePage(),
                "/child_profile_page": (context) => ChildProfilePage(),
                "/edit_child_profile_page": (context) => EditChildProfilePage(),
                "/chat_page": (context) => ChatPage(),
              },
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title), flexibleSpace: const GradientBackground()),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(l10n!.loginTitle,
                  style: Theme.of(context).textTheme.headline1),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              CustomElevatedButton(
                text: "Nyomj meg!",
                onPressed: () {},
                disabled: false,
              ),
              const CustomTextField(
                state: "",
                label: "Valami label",
              ),
              //CustomIconButton(onPressed: () {  }, type: Type.facebook, disabled: false),
              //CustomIconButton(onPressed: () {  }, type: Type.google, disabled: false),
              //CustomIconButton(onPressed: () {  }, type: Type.plus, disabled: false),
              const CustomDropdown(items: ["Nő", "Férfi"], label: "label"),
              const CustomRangeSlider(label: "label", min: 0, max: 100),
              CustomImageButton(
                  text: "Nyomj meg!",
                  onPressed: () {},
                  disabled: false,
                  icon: Icons.edit,
                  label: "Label",),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
