import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class CustomImageButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool disabled;
  final IconData icon;
  final String? label;

  const CustomImageButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.disabled,
      required this.icon,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (() {
          if (label != null) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              child: Text(
                label!.toUpperCase(),
                style: Theme.of(context).textTheme.caption,
              ),
            );
          } else {
            return const SizedBox(height: 0,);
          }
        }()),
        TextButton(
            onPressed: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Icon(icon, color: ColorConstants.grayDark),
                ],
              ),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(ColorConstants.grayLight),
                overlayColor: MaterialStateProperty.all<Color>(
                    ColorConstants.primaryLight),
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 40.h)))),
      ],
    );
  }
}
