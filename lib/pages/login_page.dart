import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_text_button.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/route_names.dart';
import 'package:onlab1/stores/filter_store.dart';
import 'package:onlab1/stores/login_store.dart';
import 'package:onlab1/stores/user_store.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginStore _loginStore = LoginStore();

  final Map<String, TextEditingController> _textControllers = {
    "email": TextEditingController(),
    "password": TextEditingController(),
  };

  final Map<String, FocusNode> _focusNodes = {
    "username": FocusNode(),
    "password": FocusNode(),
  };

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> onSuccess(UserStore userStore, FilterStore filterStore, String uid) async {
    await userStore.getUser(uid);
    await filterStore.getFilter(uid);
    Navigator.pushReplacementNamed(context, Routes.main);
  }

  void login(UserStore userStore, FilterStore filterStore) {
    _loginStore.login(onSuccess: (uid) {
      onSuccess(userStore, filterStore, uid);
    }, onError: (error) {
      showSnackBar(error);
    });
  }

  void loginWithGoogle(UserStore userStore, FilterStore filterStore) {
    _loginStore.loginWithGoogle(onSuccess: (uid) {
      onSuccess(userStore, filterStore, uid);
    }, onError: (error) {
      showSnackBar(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final _filterStore = Provider.of<FilterStore>(context);
    final L10n? l10n = L10n.of(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(l10n!.loginTitle),
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
              Observer(
                builder: (_) => CustomTextField(
                  controller: _textControllers["email"]!,
                  label: l10n.email,
                  textInputType: TextInputType.emailAddress,
                  error: _loginStore.emailError,
                  onChanged: (value) {
                    _loginStore.email = _textControllers["email"]!.text;
                  },
                  focusNode: _focusNodes["email"],
                  onSubmitted: (value) {
                    FocusScope.of(context)
                        .requestFocus(_focusNodes["password"]);
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Observer(builder: (_) {
                return CustomTextField(
                  controller: _textControllers["password"]!,
                  label: l10n.password,
                  textInputType: TextInputType.visiblePassword,
                  error: _loginStore.passwordError,
                  onChanged: (value) {
                    _loginStore.password = _textControllers["password"]!.text;
                  },
                  focusNode: _focusNodes["password"],
                  obscureText: true,
                );
              }),
              SizedBox(
                height: 50.h,
              ),
              CustomElevatedButton(
                text: l10n.login,
                onPressed: () {login(_userStore, _filterStore);},
                secondary: false,
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
                      l10n.or,
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
              CustomIconButton(
                  onPressed: () {loginWithGoogle(_userStore, _filterStore);},
                  type: Type.google,
                  disabled: false),
              SizedBox(
                height: 50.h,
              ),
              Text(
                l10n.dontHaveAccount,
                style: Theme.of(context).textTheme.caption,
              ),
              CustomTextButton(
                  text: l10n.doSignUp,
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
