import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class ChatListItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isReaded;
  final void Function()? onTap;
  final String image;

  const ChatListItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.isReaded, required this.image, this.onTap})
      : super(key: key);

  @override
  _ChatListItem createState() => _ChatListItem();
}

class _ChatListItem extends State<ChatListItem> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 30.h,
          backgroundImage: NetworkImage(widget.image)),
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      tileColor:
      widget.isReaded ? ColorConstants.primaryLight : ColorConstants.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.h),
      ),
      onTap: widget.onTap,
    );
  }
}
