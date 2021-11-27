import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool disabled;
  final IconData icon;
  final String label;

  const CustomImageButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.disabled,
      required this.icon,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          child: Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
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
                  Icon(
                    icon,
                    color: const Color.fromRGBO(76, 76, 76, 1.0),
                  ),
                ],
              ),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(236, 236, 236, 1.0)),
                overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(255, 181, 138, 0.2)),
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 40.h)))),
      ],
    );
  }
}
