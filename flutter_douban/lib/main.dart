import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/detail/detail_page.dart';
import 'package:flutter_douban/pages/home/home_page.dart';
import 'package:flutter_douban/pages/login/login_page.dart';
import 'package:flutter_douban/pages/tab_bottom.dart';
import 'package:flutter_douban/routers/application.dart';
import 'package:flutter_douban/routers/routes.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣', //程序在后台运行时提示的标题
      // onGenerateInitialRoutes: Application.router.generator,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF41bd55),
        // primaryColorBrightness: Brightness.dark
      ),
      home: //Login(),
          TabBottom(),
      //Listpage(),
      // Homepage(),
      // DetailPage(),
    );
  }
}
