import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/spm_friend_profile_page.dart';
import 'package:sport_mate/spm_main_home_page.dart';
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
        scaffoldBackgroundColor: Colors.grey,
        shadowColor: Colors.white,
      ),
      home: const SPMFriendProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
