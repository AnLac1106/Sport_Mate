

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/spm_register_page.dart';
import 'package:sport_mate/spm_welcome_page.dart';
import 'package:sport_mate/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SPMWelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}




