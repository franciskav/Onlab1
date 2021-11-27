import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool disabled;

  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.disabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.h),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
            overlayColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(255, 181, 138, 0.2)),
            minimumSize: MaterialStateProperty.all<Size>(
                Size(double.infinity, 65.h))));
  }
}
