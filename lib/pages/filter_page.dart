import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:onlab1/components/button/custom_dropdown.dart';
import 'package:onlab1/components/slider/custom_range_slider.dart';
import 'package:onlab1/components/slider/custom_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/enums/select_child_gender.dart';
import 'package:onlab1/enums/select_parent_gender.dart';
import 'package:onlab1/stores/filter_store.dart';
import 'package:onlab1/stores/user_store.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final _filterStore = Provider.of<FilterStore>(context);
    final L10n? l10n = L10n.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          children: <Widget>[
            Observer(builder: (_) {
              return CustomDropdown(
                  items: SelectParentGender.values,
                  label: l10n!.gender,
                  value: _filterStore.parentGender,
                  onChanged: (value) {
                    _filterStore.setFilter(
                        parentGender: value as SelectParentGender);
                    _filterStore.updateFilter(_userStore.getUserId, () { }, (error) {showSnackBar(error);});
                  });
            }),
            SizedBox(
              height: 10.h,
            ),
            Observer(builder: (_) {
              return CustomRangeSlider(
                label: l10n!.age,
                min: _filterStore.parentMinAgeConst,
                max: _filterStore.parentMaxAgeConst,
                metric: l10n.year,
                currentValues: RangeValues(
                    _filterStore.parentMinAge, _filterStore.parentMaxAge),
                onChanged: (values) {
                  _filterStore.setFilter(
                      parentMinAge: values.start.toInt(),
                      parentMaxAge: values.end.toInt());
                },
                onChangedEnd: (values) {
                  _filterStore.setFilter(
                      parentMinAge: values.start.toInt(),
                      parentMaxAge: values.end.toInt());
                  _filterStore.updateFilter(_userStore.getUserId, () { }, (error) {showSnackBar(error);});
                },
              );
            }),
            SizedBox(
              height: 10.h,
            ),
            Observer(builder: (_) {
              return CustomDropdown(
                  items: SelectChildGender.values,
                  label: l10n!.childrenGender,
                  value: _filterStore.childrenGender,
                  onChanged: (value) {
                    _filterStore.setFilter(
                        childrenGender: value as SelectChildGender);
                    _filterStore.updateFilter(_userStore.getUserId, () { }, (error) {showSnackBar(error);});
                  });
            }),
            SizedBox(
              height: 10.h,
            ),
            Observer(builder: (_) {
              return CustomRangeSlider(
                label: l10n!.childrenAge,
                min: _filterStore.childMinAgeConst,
                max: _filterStore.childMaxAgeConst,
                metric: l10n.year,
                currentValues: RangeValues(
                    _filterStore.childrenMinAge, _filterStore.childrenMaxAge),
                onChanged: (values) {
                  _filterStore.setFilter(
                      childrenMinAge: values.start.toInt(),
                      childrenMaxAge: values.end.toInt());
                },
                onChangedEnd: (values) {
                  _filterStore.setFilter(
                      childrenMinAge: values.start.toInt(),
                      childrenMaxAge: values.end.toInt());
                  _filterStore.updateFilter(_userStore.getUserId, () { }, (error) {showSnackBar(error);});
                },
              );
            }),
            // SizedBox(
            //   height: 10.h,
            // ),
            // CustomSlider(
            //     label: l10n.distance,
            //     max: _filterStore.maxDistanceConst,
            //     metric: l10n.km)
          ],
        ),
      ),
    );
  }
}
