import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:onlab1/components/button/custom_icon_button.dart';
import 'package:onlab1/components/button/custom_text_button.dart';
import 'package:onlab1/components/listItem/chat_list_item.dart';
import 'package:onlab1/components/textField/custom_text_field.dart';
import 'package:onlab1/components/button/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {

  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 25.h),
        child: Column(
          children: <Widget>[
            ChatListItem(title: 'Sample User', subtitle: 'Lorem ipsum..', isReaded: false, onTap: () {},),
            SizedBox(height: 15.h,),
            ChatListItem(title: 'Sample User', subtitle: 'Lorem ipsum..', isReaded: true, onTap: () {},),
          ],
        ),
      ),
    );
  }
}
