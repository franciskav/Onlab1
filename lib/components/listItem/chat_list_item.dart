import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class ChatListItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isReaded;
  final void Function()? onTap;

  const ChatListItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.isReaded, this.onTap})
      : super(key: key);

  @override
  _ChatListItem createState() => _ChatListItem(title, subtitle, isReaded, onTap);
}

class _ChatListItem extends State<ChatListItem> {
  String title;
  String subtitle;
  bool isReaded;
  void Function()? onTap;

  _ChatListItem(this.title, this.subtitle, this.isReaded, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 30.h,
          backgroundImage: const NetworkImage('https://picsum.photos/200')),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      tileColor:
          isReaded ? ColorConstants.primaryLight : ColorConstants.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.h),
      ),
      onTap: onTap,
    );
  }
}
