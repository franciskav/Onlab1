import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_text_button.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';
import 'package:onlab1/config/route_names.dart';
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
  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final L10n? l10n = L10n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.h),
            leading: CircleAvatar(
                minRadius: 30.h,
                maxRadius: 60.h,
                backgroundImage: NetworkImage(_userStore.user.photo!,)),
            title: Text(
              _userStore.user.name!,
              style: Theme.of(context).textTheme.headline3,
            ),
            tileColor: ColorConstants.grayLight,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kor'.toUpperCase(), style: Theme.of(context).textTheme.caption,),
                Text(_userStore.getUserAge, style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: 15.h,),
                Text('Nem'.toUpperCase(), style: Theme.of(context).textTheme.caption,),
                Text(_userStore.getUserGender, style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: 15.h,),
                Text('Bemutatkozás'.toUpperCase(), style: Theme.of(context).textTheme.caption,),
                Text(_userStore.getUserIntroduction, style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: 15.h,),
                Text('Kor'.toUpperCase(), style: Theme.of(context).textTheme.caption,),
                Text(_userStore.getUserAge, style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: 15.h,),
                Text('Gyerekek'.toUpperCase(), style: Theme.of(context).textTheme.caption,),
                Text('Julcsi (3)', style: Theme.of(context).textTheme.bodyText1,),
                Text('Mindig mosolygós kislány.', style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: 15.h,),
                Text('Peti (1)', style: Theme.of(context).textTheme.bodyText1,),
                Text('Izgő-mozgó kisfiú.', style: Theme.of(context).textTheme.bodyText1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
