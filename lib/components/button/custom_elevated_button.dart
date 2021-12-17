import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool secondary;

  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.secondary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: secondary ? ColorConstants.gray : ColorConstants.white),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.h),
              ),
            ),
            backgroundColor:
                secondary ? MaterialStateProperty.all<Color>(ColorConstants.grayLight) : MaterialStateProperty.all<Color>(ColorConstants.primary),
            overlayColor: MaterialStateProperty.all<Color>(
                ColorConstants.primaryLightGradient),
            minimumSize:
                MaterialStateProperty.all<Size>(Size(double.infinity, 65.h))));
  }
}
