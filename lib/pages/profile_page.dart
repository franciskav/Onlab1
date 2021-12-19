import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/row/name_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/components/row/labeled_text.dart';
import 'package:onlab1/config/route_names.dart';
import 'package:onlab1/models/child.dart';
import 'package:onlab1/models/edit_page_arguments.dart';
import 'package:onlab1/stores/login_store.dart';
import 'package:onlab1/stores/user_store.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _loginStore = LoginStore();

  FutureOr onGoBack(UserStore _userStore) {
    _userStore.setTempUser();
    setState(() {});
  }

  Widget listChildren(List<Child> children) {
    String getAge(DateTime dateOfBirth) {
      int days = (DateTime.now().difference(dateOfBirth).inDays);
      if (days < 365) {
        return '${(days / 30).round()} hónapos';
      }
      return '${(days / 365).round()} éves';
    }

    return Observer(builder: (_) {
      return ListView.builder(
          itemCount: children.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 5.w, bottom: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${children[index].name!} (${getAge(children[index].birthDate!)})',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    children[index].introduction!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final L10n? l10n = L10n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n!.profile),
        flexibleSpace: const GradientBackground(),
        actions: [
          IconButton(
            onPressed: () {
              _userStore.initTempUser();
              Navigator.pushNamed(context, Routes.editProfile,
                      arguments: EditPageArguments(false))
                  .then((_) => onGoBack(_userStore));
            },
            icon: const Icon(Icons.edit_outlined),
            iconSize: 45.h,
          ),
          IconButton(
            onPressed: () {
              _loginStore.logout(onSignedOut: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, ModalRoute.withName('/'));
              });
            },
            icon: const Icon(Icons.logout_outlined),
            iconSize: 45.h,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NameRow(name: _userStore.user.name!, photo: _userStore.user.photo!),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Observer(builder: (_) {
                      return LabeledText(
                          label: l10n.age, text: _userStore.getUserAge);
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                    Observer(builder: (_) {
                      return LabeledText(
                          label: l10n.gender, text: _userStore.getUserGender);
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                    Observer(builder: (_) {
                      return LabeledText(
                          label: l10n.introduction,
                          text: _userStore.getUserIntroduction);
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      l10n.kids.toUpperCase(),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    listChildren(_userStore.user.children!),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
