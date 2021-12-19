import 'package:flutter/material.dart';
import 'package:onlab1/pages/chat_page.dart';
import 'package:onlab1/pages/edit_child_profile_page.dart';
import 'package:onlab1/pages/edit_profile_page.dart';
import 'package:onlab1/pages/login_page.dart';
import 'package:onlab1/pages/main_page.dart';
import 'package:onlab1/pages/profile_page.dart';
import 'package:onlab1/pages/sign_up_page.dart';

class Routes {
  static const String login = "/login_page";
  static const String signup = "/signup_page";
  static const String main = "/main_page";
  static const String profile = "/profile_page";
  static const String editProfile = "/edit_profile_page";
  static const String childProfile = "/child_profile_page";
  static const String editChildProfile = "/edit_child_profile_page";
  static const String chat = "/chat_page";

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.login: (context) => LoginPage(),
    Routes.signup: (context) => SignUpPage(),
    Routes.main: (context) => MainPage(),
    Routes.profile: (context) => ProfilePage(),
    Routes.editProfile: (context) => EditProfilePage(),
    Routes.editChildProfile: (context) => EditChildProfilePage(),
    Routes.chat: (context) => ChatPage(),
  };
}