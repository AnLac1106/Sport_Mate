import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/function/spm_popupmenubutton1.dart';
import 'package:sport_mate/function/spm_status_box.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';
import 'package:sport_mate/spm_friend_profile_page.dart';
import 'package:sport_mate/spm_main_home_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';
import 'package:sport_mate/spm_notification_page.dart';
import 'package:sport_mate/spm_profile_page.dart';
import 'package:sport_mate/spm_welcome_page.dart';
import 'package:sport_mate/sm_navigatorbar.dart';
import 'package:sport_mate/spm_create_game_detail/components/spm_time_cuper.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';

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
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData.dark(),
      home: const SPMWelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
