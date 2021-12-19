import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final void Function(String) onChanged;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  final String? error;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? multiLine;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.textInputType,
      this.obscureText,
      this.multiLine,
      this.error,
      required this.onChanged,
      this.focusNode,
      this.onSubmitted})
      : super(key: key);

  @override
  _CustomTextField createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  _CustomTextField();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int getMaxLines () {
    if (widget.obscureText != true && widget.multiLine == true) {
      return 5;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          child: Text(
            widget.label.toUpperCase(),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          focusNode: widget.focusNode,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
              errorText: widget.error,
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
                  borderSide:
                      const BorderSide(color: ColorConstants.gray, width: 1)),
              filled: true,
              fillColor: ColorConstants.grayLight,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w)),
          style: Theme.of(context).textTheme.bodyText1,
          minLines: 1,
          maxLines: getMaxLines(),
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText ?? false,
        ),
      ],
    );
  }
}
