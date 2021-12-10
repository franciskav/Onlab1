import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';
import 'package:onlab1/config/route_names.dart';
import 'package:onlab1/pages/chat_list_page.dart';
import 'package:onlab1/pages/notation_page.dart';
import 'filter_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FilterPage(),
    ChatListPage(),
    NotationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final L10n? l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
        flexibleSpace: const GradientBackground(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.profile);
            },
            icon: const Icon(Icons.account_circle_outlined),
            iconSize: 45.h,
          ),
        ],
      ),
      body: Container(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.0, 0.4],
                colors: [ColorConstants.primaryLight, ColorConstants.primary])),
        child: BottomNavigationBar(
          backgroundColor: ColorConstants.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_alt_outlined, size: 40.h),
              label: "Szűrők",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded, size: 40.h),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_search_outlined, size: 40.h),
              label: "Keresés",
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: ColorConstants.white,
          unselectedItemColor: ColorConstants.gray,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
