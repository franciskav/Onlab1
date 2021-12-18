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

class NotationPage extends StatefulWidget {
  const NotationPage({Key? key,}) : super(key: key);

  @override
  State<NotationPage> createState() => _NotationPageState();
}

class _NotationPageState extends State<NotationPage> {

  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.h),
          leading: CircleAvatar(
              minRadius: 30.h,
              maxRadius: 60.h,
              backgroundImage: NetworkImage('https://picsum.photos/300')),
          title: Text(
            'Laky Fanni',
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
              Text('26', style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 15.h,),
              Text('Nem'.toUpperCase(), style: Theme.of(context).textTheme.caption,),
              Text('Nő', style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 15.h,),
              Text('Bemutatkozás'.toUpperCase(), style: Theme.of(context).textTheme.caption,),
              Text('Kisvárosban élünk a családunkkal, van két gyerkőcünk és két kutyánk.', style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 15.h,),
              SizedBox(height: 15.h,),
              Text('Gyerekek'.toUpperCase(), style: Theme.of(context).textTheme.caption,),
              Text('Tomi (4)', style: Theme.of(context).textTheme.bodyText1,),
              Text('Imádja az autókat és igazi vagány kissrác.', style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 15.h,),
              Text('Tibi (2)', style: Theme.of(context).textTheme.bodyText1,),
              Text('Izgő-mozgó kisfiú.', style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 25.h,),
              CustomElevatedButton(text: 'Elvet', onPressed: () {}, secondary: true),
              SizedBox(height: 15.h,),
              CustomElevatedButton(text: 'Jelölés', onPressed: () {}, secondary: false),


            ],
          ),
        )
      ],
    );
  }
}
