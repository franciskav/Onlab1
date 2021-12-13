import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

enum Type { facebook, google, plus }

class CustomIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool? disabled;
  final Type type;

  const CustomIconButton(
      {Key? key, required this.onPressed, this.disabled, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: ShapeDecoration(
            color: type == Type.facebook
                ? ColorConstants.white
                : type == Type.google
                    ? ColorConstants.white
                    : ColorConstants.grayLight,
            shape: const CircleBorder()),
        child: IconButton(
            onPressed: onPressed,
            iconSize: 60.h,
            splashRadius: 40.h,
            padding: const EdgeInsets.all(0),
            icon: type == Type.facebook
                ? const Icon(
                    Icons.facebook,
                    color: ColorConstants.facebook,
                  )
                : type == Type.google
                    ? const Icon(
                        Icons.email_outlined,
                        color: ColorConstants.google,
                        size: 50,
                      )
                    : const Icon(
                        Icons.add_rounded,
                        color: ColorConstants.grayDark,
                      )),
      ),
    );
  }
}
