import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/route_names.dart';
import 'package:onlab1/config/theme_config.dart';
import 'package:onlab1/pages/login_page.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/stores/filter_store.dart';
import 'package:onlab1/stores/notation_store.dart';
import 'package:onlab1/stores/user_store.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => UserStore()),
        Provider<FilterStore>(create: (_) => FilterStore()),
        Provider<NotationStore>(create: (_) => NotationStore()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeConfig.createTheme(),
              localizationsDelegates: L10n.localizationsDelegates,
              supportedLocales: L10n.supportedLocales,
              home: const LoginPage(),
              routes: Routes.routes)),
    );
  }
}
