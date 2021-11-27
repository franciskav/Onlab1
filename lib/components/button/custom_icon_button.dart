import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                ? Colors.white
                : type == Type.google
                    ? const Color.fromRGBO(219, 68, 55, 1)
                    : const Color.fromRGBO(236, 236, 236, 1),
            shape: const CircleBorder()),
        child: IconButton(
            onPressed: onPressed,
            iconSize: 60.h,
            splashRadius: 40.h,
            padding: const EdgeInsets.all(0),
            icon: type == Type.facebook
                ? const Icon(
                    Icons.facebook,
                    color: Color.fromRGBO(66, 103, 178, 1),
                  )
                : type == Type.google
                    ? const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                        size: 50,
                      )
                    : const Icon(
                        Icons.add_rounded,
                        color: Color.fromRGBO(76, 76, 76, 1),
                      )),
      ),
    );
  }
}
