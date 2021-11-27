import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.h),
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(255, 181, 138, 0.2)),
      ),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
