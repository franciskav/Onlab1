import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String text;

  const LabeledText({Key? key, required this.label, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: Theme.of(context).textTheme.caption,),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(text, style: Theme.of(context).textTheme.bodyText1,),
        ),
      ],
    );
  }
}