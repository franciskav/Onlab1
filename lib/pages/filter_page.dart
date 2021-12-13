import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_dropdown.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_text_button.dart';
import 'package:onlab1/components/slider/custom_range_slider.dart';
import 'package:onlab1/components/slider/custom_slider.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // CustomDropdown(
            //     items: ["Nő", "Férfi", "Mindkettő"], label: "Nem:", onChanged: (value) {}),
            SizedBox(
              height: 10.h,
            ),
            const CustomRangeSlider(label: "Kor:", min: 18, max: 100, metric: "év",),
            SizedBox(
              height: 10.h,
            ),
            // CustomDropdown(
            //     items: ["Kislány", "Kisfiú", "Mindkettő"], label: "Gyerek neme:", onChanged: (value) {}),
            SizedBox(
              height: 10.h,
            ),
            const CustomRangeSlider(label: "Gyermekek kora:", min: 0, max: 18, metric: "év",),
            SizedBox(
              height: 10.h,
            ),
            const CustomSlider(label: "Távolság:", max: 100, metric: "km")
          ],
        ),
      ),
    );
  }
}
