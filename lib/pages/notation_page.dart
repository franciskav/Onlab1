import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:onlab1/components/row/labeled_text.dart';
import 'package:onlab1/components/row/name_row.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/enums/parent_gender.dart';
import 'package:onlab1/models/child.dart';
import 'package:onlab1/stores/filter_store.dart';
import 'package:onlab1/stores/notation_store.dart';
import 'package:onlab1/stores/user_store.dart';
import 'package:provider/provider.dart';

class NotationPage extends StatefulWidget {
  const NotationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NotationPage> createState() => _NotationPageState();
}

class _NotationPageState extends State<NotationPage> {
  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Widget listChildren(List<Child> children) {
    String getAge(DateTime dateOfBirth) {
      int days = (DateTime.now().difference(dateOfBirth).inDays);
      if (days < 365) {
        return '${(days / 30).round()} hónapos';
      }
      return '${(days / 365).round()} éves';
    }

    return Observer(builder: (_) {
      return ListView.builder(
          itemCount: children.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 5.w, bottom: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${children[index].name!} (${getAge(children[index].birthDate!)})',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    children[index].introduction!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final _filterStore = Provider.of<FilterStore>(context);
    final _notationStore = Provider.of<NotationStore>(context);
    final L10n? l10n = L10n.of(context);

    return _notationStore.filteredUser != null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Observer(builder: (_) {
                return NameRow(
                    name: _notationStore.filteredUser!.name!,
                    photo: _notationStore.filteredUser!.photo!);
              }),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Observer(builder: (_) {
                          return LabeledText(
                              label: l10n!.age,
                              text: (DateTime.now()
                                          .difference(_notationStore
                                              .filteredUser!.birthDate!)
                                          .inDays /
                                      365)
                                  .round()
                                  .toString());
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        Observer(builder: (_) {
                          return LabeledText(
                              label: l10n!.gender,
                              text: _notationStore.filteredUser!.gender ==
                                      ParentGender.man
                                  ? 'Férfi'
                                  : 'Nő');
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        Observer(builder: (_) {
                          return LabeledText(
                              label: l10n!.introduction,
                              text: _notationStore.filteredUser!.introduction!);
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          l10n!.kids.toUpperCase(),
                          style: Theme.of(context).textTheme.caption,
                        ),
                        listChildren(_notationStore.filteredUser!.children!),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomElevatedButton(
                            text: 'Elvet',
                            onPressed: () {
                              _notationStore.reject(_userStore.getUserId,
                                  _notationStore.filteredUser!.id!, () {
                                _notationStore.getFilteredUsers(
                                    _userStore.getUserId, _filterStore.filter);
                                setState(() {});
                              }, (error) {
                                showSnackBar(error);
                              });
                            },
                            secondary: true),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomElevatedButton(
                            text: 'Jelölés',
                            onPressed: () {
                              _notationStore.accept(_userStore.getUserId,
                                  _notationStore.filteredUser!.id!, () {
                                _notationStore.getFilteredUsers(
                                    _userStore.getUserId, _filterStore.filter);
                                setState(() {});
                              }, (error) {
                                showSnackBar(error);
                              });
                            },
                            secondary: false),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        : Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Nem található új ajánlás', style: Theme.of(context).textTheme.headline4,),
                SizedBox(
                  height: 15.h,
                ),
                CustomElevatedButton(
                    text: 'Frissítés',
                    onPressed: () async {
                      await _notationStore.getFilteredUsers(
                          _userStore.getUserId, _filterStore.filter);
                      setState(() {});
                    },
                    secondary: false),
              ],
            ),
        );
  }
}
