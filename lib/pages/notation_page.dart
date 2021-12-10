import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_text_button.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotationPage extends StatefulWidget {
  const NotationPage({Key? key,}) : super(key: key);

  @override
  State<NotationPage> createState() => _NotationPageState();
}

class _NotationPageState extends State<NotationPage> {

  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Notation")
          ],
        ),
      ),
    );
  }
}
