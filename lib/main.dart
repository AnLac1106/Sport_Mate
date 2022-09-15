import 'package:flutter/material.dart';
import 'package:get/get.dart';
// <<<<<<< HEAD
import 'package:sport_mate/spm_newfeed_page.dart';
import 'package:sport_mate/spm_register_page.dart';
import 'package:sport_mate/spm_welcome_page.dart';
import 'package:sport_mate/test.dart';
// =======
import 'package:sport_mate/spm_main_home_page.dart';

import 'common/spm_colors.dart';
// >>>>>>> 048e8d054d23242ed5c2a53e64144cba1b58f99e

void main() {
  runApp(const MyApp());
}

class MyApp extends GetView {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Scope One',
        // primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black12,
        shadowColor: Colors.white,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30.0,
            color: SPMColors.secondaryColor,
            letterSpacing: 2.0,
          ),
          headline4: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.black),
          bodyText1: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16.0, color: Colors.black),
        ),
      ),
// <<<<<<< HEAD
//       home: const SPMNewFeedPage(),
// =======
      home: const MainHomePage(),
      // SPMWelcomePage(),
// >>>>>>> 048e8d054d23242ed5c2a53e64144cba1b58f99e
//       debugShowCheckedModeBanner: false,
    );
  }
}
