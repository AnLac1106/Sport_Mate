import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/function/photo_builder.dart';
import 'package:sport_mate/spm_newfeed_page.dart';
import 'package:sport_mate/spm_profile_page.dart';
import 'package:sport_mate/spm_register_page.dart';
import 'package:sport_mate/spm_welcome_page.dart';
import 'package:sport_mate/test.dart';
import 'package:sport_mate/spm_main_home_page.dart';

import 'common/spm_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends GetView {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        // brightness: Brightness.dark,
        // fontFamily: 'Scope One',

        scaffoldBackgroundColor: Colors.black12,
        shadowColor: Colors.white,
      ),

      home: const SPMNewFeedPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
