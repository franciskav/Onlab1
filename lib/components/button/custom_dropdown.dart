import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
  final String? value;
  final List<String> items;
  final String label;

  const CustomDropdown(
      {Key? key, this.value, required this.items, required this.label})
      : super(key: key);

  @override
  _CustomDropdown createState() => _CustomDropdown(value, items, label);
}

class _CustomDropdown extends State<CustomDropdown> {
  String? value;
  List<String> items;
  String label;

  _CustomDropdown(this.value, this.items, this.label);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
        DropdownButtonFormField(
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
                  borderSide: BorderSide(
                      color: const Color.fromRGBO(143, 142, 142, 1.0), width: 1.w)),
              filled: true,
              fillColor: const Color.fromRGBO(236, 236, 236, 1.0),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w)),
          style: Theme.of(context).textTheme.bodyText1,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              value = newValue;
            });
          },
        ),
      ],
    );
  }
}
