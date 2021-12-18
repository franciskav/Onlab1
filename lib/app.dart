import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/route_names.dart';
import 'package:onlab1/config/theme_config.dart';
import 'package:onlab1/pages/edit_profile_page.dart';
import 'package:onlab1/pages/error_page.dart';
import 'package:onlab1/pages/loading_page.dart';
import 'package:onlab1/pages/login_page.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:onlab1/pages/main_page.dart';
import 'package:onlab1/stores/filter_store.dart';
import 'package:onlab1/stores/login_store.dart';
import 'package:onlab1/stores/user_store.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  //final Future<FirebaseApp> _initFirebaseSdk = Firebase.initializeApp();
  final _navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //     return MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       navigatorKey: _navigatorKey,
    //       theme: ThemeConfig.createTheme(),
    //       home: FutureBuilder(
    //         future: _initFirebaseSdk,
    //         builder: (_, snapshot) {
    //           if (snapshot.hasError) return const ErrorPage();
    //           if (snapshot.connectionState == ConnectionState.done) {
    //             FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //               if (user == null) {
    //                 _navigatorKey.currentState!.pushReplacementNamed(Routes.login);
    //               }
    //               else {
    //                 _navigatorKey.currentState!.pushReplacementNamed(Routes.main);
    //               }
    //             });
    //           }
    //
    //           return const LoadingPage();
    //         },
    //       ),
    //       routes: Routes.routes,
    //     );
    //   }
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => UserStore()),
        Provider<FilterStore>(create: (_) => FilterStore()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: () => MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeConfig.createTheme(),
              localizationsDelegates: L10n.localizationsDelegates,
              supportedLocales: L10n.supportedLocales,
              home: const LoginPage(),
              //home: const EditProfilePage(),
              routes: Routes.routes)),
    );
  }
}
