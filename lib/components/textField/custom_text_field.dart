import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class CustomTextField extends StatefulWidget {
  final String state;
  final String label;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? multiLine;

  const CustomTextField(
      {Key? key, required this.state, required this.label, this.textInputType, this.obscureText, this.multiLine})
      : super(key: key);

  @override
  _CustomTextField createState() => _CustomTextField(state, label, textInputType, obscureText ?? false, multiLine ?? false);
}

class _CustomTextField extends State<CustomTextField> {
  String state;
  String label;
  TextInputType? textInputType;
  bool obscureText;
  bool multiLine;
  _CustomTextField(this.state, this.label, this.textInputType, this.obscureText, this.multiLine);

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        TextField(
          controller: _controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: const BorderSide(
                      color: ColorConstants.grayLight, width: 0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: const BorderSide(
                      color: ColorConstants.grayLight, width: 0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: const BorderSide(
                      color: ColorConstants.gray, width: 1)),
              filled: true,
              fillColor: ColorConstants.grayLight,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w)),
          style: Theme.of(context).textTheme.bodyText1,
          minLines: 1,
          maxLines: !obscureText && multiLine ? 5 : 1,
          keyboardType: textInputType,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
