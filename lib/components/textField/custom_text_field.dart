import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String state;
  final String label;
  final bool? isMultiline;

  const CustomTextField(
      {Key? key, required this.state, required this.label, this.isMultiline})
      : super(key: key);

  @override
  _CustomTextField createState() => _CustomTextField(state, label, isMultiline);
}

class _CustomTextField extends State<CustomTextField> {
  String state;
  String label;
  bool? isMultiline;
  _CustomTextField(this.state, this.label, this.isMultiline);

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
                      color: Color.fromRGBO(236, 236, 236, 1.0), width: 0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(236, 236, 236, 1.0), width: 0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(143, 142, 142, 1.0), width: 1)),
              filled: true,
              fillColor: const Color.fromRGBO(236, 236, 236, 1.0),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w)),
          style: Theme.of(context).textTheme.bodyText1,
          minLines: 1,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          //expands: true,
        ),
      ],
    );
  }
}
