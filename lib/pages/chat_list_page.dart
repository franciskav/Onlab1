import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/listItem/chat_list_item.dart';
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
            ChatListItem(title: 'Kiss Kata', subtitle: 'Szia, hogy vagy?', image: 'https://picsum.photos/200', isReaded: false, onTap: () {},),
            SizedBox(height: 15.h,),
            ChatListItem(title: 'Nagy Anna', subtitle: 'Kedden hétkor találkozunk a...', image: 'https://picsum.photos/300', isReaded: true, onTap: () {},),
          ],
        ),
      ),
    );
  }
}
