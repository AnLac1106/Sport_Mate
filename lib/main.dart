import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/sm_navigatorbar.dart';

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
      home: const BottomBarPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
