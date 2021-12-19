import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final String text;

  CustomSnackBar(this.text, {Key? key}) : super(key: key, content: Text(text));

}