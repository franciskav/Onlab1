import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlab1/config/color_constants.dart';

class CustomImagePicker extends StatefulWidget {
  final String? label;
  final String? value;
  final Function(String) onChanged;

  const CustomImagePicker({Key? key, this.label, this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomImagePicker createState() => _CustomImagePicker();
}

class _CustomImagePicker extends State<CustomImagePicker> {
  Widget renderChild() {
    if (widget.value == null) {
      return Container(child: const Icon(Icons.image, color: ColorConstants.grayDark,), color: ColorConstants.grayLight,);
    } else {
      if (widget.value!.startsWith('http')) {
        return Image.network(
          widget.value!,
          fit: BoxFit.cover,
        );
      }
    }
    return Image.file(File(widget.value!), fit: BoxFit.cover,);
  }

  void onTap() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      print(image.path);
      widget.onChanged(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (() {
          if (widget.label != null) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              child: Text(
                widget.label!.toUpperCase(),
                style: Theme.of(context).textTheme.caption,
              ),
            );
          } else {
            return const SizedBox(
              height: 0,
            );
          }
        }()),
        GestureDetector(
            onTap: onTap,
            child: SizedBox(
              width: 200.w,
              height: 200.w,
              child: ClipRRect(
                child: renderChild(),
                borderRadius: BorderRadius.circular(8.0),
              ),
            )),
      ],
    );
  }
}
