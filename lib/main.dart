import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/sm_navigatorbar.dart';
import 'package:sport_mate/spm_newfeed_page.dart';
import 'package:sport_mate/spm_onboarding_page.dart';
import 'package:sport_mate/spm_single_feed_page.dart';
import 'package:sport_mate/spm_update_infor.dart';
import 'package:sport_mate/spm_profile_page.dart';
import 'package:sport_mate/spm_register_page.dart';
import 'package:sport_mate/spm_update_infor.dart';
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
        scaffoldBackgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      home: const SPMNewFeedPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
