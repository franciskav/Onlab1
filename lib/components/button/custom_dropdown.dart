import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class CustomDropdown extends StatefulWidget {
  final Enum? value;
  final List<Enum> items;
  final String label;
  final void Function(Enum? value) onChanged;

  const CustomDropdown(
      {Key? key, this.value, required this.items, required this.label, required this.onChanged})
      : super(key: key);

  @override
  _CustomDropdown createState() => _CustomDropdown();
}

class _CustomDropdown extends State<CustomDropdown> {
  _CustomDropdown();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String getName(String value) {
    switch (value) {
      case 'man':
        return 'Férfi';
      case 'woman':
        return 'Nő';
      case 'girl':
        return 'Kislány';
      case 'boy':
        return 'Kisfiú';
      case 'any':
        return 'Mindegy';
    }
    return '';
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
        DropdownButtonFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide:
                      const BorderSide(color: ColorConstants.grayLight, width: 0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide:
                      const BorderSide(color: ColorConstants.grayLight, width: 0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: BorderSide(color: ColorConstants.gray, width: 1.w)),
              filled: true,
              fillColor: ColorConstants.grayLight,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w)),
          style: Theme.of(context).textTheme.bodyText1,
          items: widget.items.map((Enum value) {
            return DropdownMenuItem<Enum>(
              value: value,
              child: Text(getName(describeEnum(value))),
            );
          }).toList(),
          onChanged: (Enum? newValue) {
            setState(() {
              widget.onChanged(newValue);
            });
          },
          value: widget.value,
        ),
      ],
    );
  }
}
