import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class NameRow extends StatelessWidget {
  final String name;
  final String photo;

  const NameRow({Key? key, required this.name, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.h),
      leading: CircleAvatar(
          minRadius: 30.h,
          maxRadius: 60.h,
          backgroundImage: NetworkImage(photo,)),
      title: Text(
        name,
        style: Theme.of(context).textTheme.headline3,
      ),
      tileColor: ColorConstants.grayLight,
    );
  }
}