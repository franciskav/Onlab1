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
import 'package:onlab1/stores/sign_up_store.dart';
import 'package:onlab1/stores/user_store.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpStore _signUpStore = SignUpStore();

  final Map<String, TextEditingController> _textControllers = {
    "email": TextEditingController(),
    "password": TextEditingController(),
    "password_again": TextEditingController(),
  };

  final Map<String, FocusNode> _focusNodes = {
    "username": FocusNode(),
    "password": FocusNode(),
    "password_again": FocusNode(),
  };

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void signUp(UserStore store) {
    _signUpStore.signUp(onSuccess: (user) {
      store.setNewUSer(user);
      Navigator.pushReplacementNamed(context, Routes.editProfile);
      store.initTempUser();
    }, onError: (error) {
      showSnackBar(error);
    });
  }

  void signUpWithGoogle(UserStore store) {
    _signUpStore.signUpWithGoogle(onSuccess: (user) {
      store.setNewUSer(user);
      Navigator.pushReplacementNamed(context, Routes.editProfile);
      store.initTempUser();
    }, onError: (error) {
      showSnackBar(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final L10n? l10n = L10n.of(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(l10n!.signUp), flexibleSpace: const GradientBackground()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
              Observer(builder: (_) {
                return CustomTextField(
                  controller: _textControllers["email"]!,
                  label: l10n.email,
                  textInputType: TextInputType.emailAddress,
                  error: _signUpStore.emailError,
                  onChanged: (value) {
                    _signUpStore.email = _textControllers["email"]!.text;
                  },
                  focusNode: _focusNodes["email"],
                  onSubmitted: (value) {
                    FocusScope.of(context)
                        .requestFocus(_focusNodes["password"]);
                  },
                );
              }),
              SizedBox(
                height: 10.h,
              ),
              Observer(builder: (_) {
                return CustomTextField(
                  controller: _textControllers["password"]!,
                  label: l10n.password,
                  textInputType: TextInputType.visiblePassword,
                  error: _signUpStore.passwordError,
                  onChanged: (value) {
                    _signUpStore.password = _textControllers["password"]!.text;
                  },
                  focusNode: _focusNodes["password"],
                  onSubmitted: (value) {
                    FocusScope.of(context)
                        .requestFocus(_focusNodes["passwordAgain"]);
                  },
                  obscureText: true,
                );
              }),
              SizedBox(
                height: 10.h,
              ),
              Observer(builder: (_) {
                return CustomTextField(
                  controller: _textControllers["password_again"]!,
                  label: l10n.passwordAgain,
                  textInputType: TextInputType.visiblePassword,
                  error: _signUpStore.passwordAgainError,
                  onChanged: (value) {
                    _signUpStore.passwordAgain =
                        _textControllers["password_again"]!.text;
                  },
                  focusNode: _focusNodes["password_again"],
                  obscureText: true,
                );
              }),
              SizedBox(
                height: 50.h,
              ),
              CustomElevatedButton(
                text: l10n.signUp,
                onPressed: () {
                  signUp(_userStore);
                },
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
                  onPressed: () {
                    signUpWithGoogle(_userStore);
                  },
                  type: Type.google,
                  disabled: false),
              SizedBox(
                height: 50.h,
              ),
              Text(
                l10n.alreadyHaveAccount,
                style: Theme.of(context).textTheme.caption,
              ),
              CustomTextButton(
                  text: l10n.doLogin,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
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
