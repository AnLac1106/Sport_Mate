import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/function/spm_popupmenubutton1.dart';
import 'package:sport_mate/function/spm_status_box.dart';
import 'package:sport_mate/spm_main_home_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';
import 'package:sport_mate/spm_profile_page.dart';
import 'package:sport_mate/spm_welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends GetView {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
        shadowColor: Colors.white,
      ),
      home: const SPMNewFeedPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
