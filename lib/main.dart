import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/spm_onboarding_page.dart';
import 'package:sport_mate/spm_update_infor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends GetView {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      home: const SPMOnBoardingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
