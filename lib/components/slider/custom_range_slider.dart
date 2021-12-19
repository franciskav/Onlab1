import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class CustomRangeSlider extends StatefulWidget {
  final String label;
  final int min;
  final int max;
  final String? metric;
  final RangeValues currentValues;
  final void Function(RangeValues)? onChanged;
  final void Function(RangeValues)? onChangedEnd;

  const CustomRangeSlider(
      {Key? key,
      required this.label,
      required this.min,
      required this.max,
      required this.currentValues,
      required this.onChanged,
      required this.onChangedEnd,
      this.metric})
      : super(key: key);

  @override
  _CustomRangeSlider createState() => _CustomRangeSlider();
}

class _CustomRangeSlider extends State<CustomRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          child: Text(
            '${widget.label} ${widget.currentValues.start.toInt()}-${widget.currentValues.end.toInt()} ${widget.metric ?? ""}'
                .toUpperCase(),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: ColorConstants.primary,
            inactiveTrackColor: ColorConstants.grayLight,
            thumbColor: ColorConstants.primary,
            overlayColor: ColorConstants.primaryLightGradient,
            trackHeight: 2.h,
            valueIndicatorColor: ColorConstants.grayLight,
            valueIndicatorTextStyle: Theme.of(context).textTheme.bodyText1,
          ),
          child: RangeSlider(
            values: widget.currentValues,
            min: widget.min.toDouble(),
            max: widget.max.toDouble(),
            divisions: (widget.max - widget.min),
            labels: RangeLabels(
              widget.currentValues.start.toInt().toString(),
              widget.currentValues.end.toInt().toString(),
            ),
            onChanged: widget.onChanged,
            onChangeEnd: widget.onChangedEnd,
          ),
        )
      ],
    );
  }
}
