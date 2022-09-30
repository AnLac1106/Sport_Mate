// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sport_mate/common/spm_select_button.dart';
import 'package:sport_mate/spm_create_game_detail/components/spm_header.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';

class SPMUpdateInfor extends GetView<CreateGameCtrl> {
  const SPMUpdateInfor({Key? key}) : super(key: key);

  @override
  CreateGameCtrl get controller => Get.put<CreateGameCtrl>(CreateGameCtrl());

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return Scaffold(
      body: Container(
        clipBehavior: Clip.hardEdge,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: <Widget>[

              ],
            ),
          ),
        ),
      ),
    );
  }
}
