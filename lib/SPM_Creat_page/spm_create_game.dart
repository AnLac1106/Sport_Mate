// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/SPM_Creat_page/components/spm_date.dart';
import 'package:sport_mate/SPM_Creat_page/components/spm_description.dart';
import 'package:sport_mate/SPM_Creat_page/components/spm_header.dart';
import 'package:sport_mate/SPM_Creat_page/components/spm_level.dart';
import 'package:sport_mate/SPM_Creat_page/components/spm_partners.dart';
import 'package:sport_mate/SPM_Creat_page/components/spm_place.dart';
import 'package:sport_mate/SPM_Creat_page/components/spm_time.dart';
import 'package:sport_mate/common/spm_select_button.dart';

enum SelectedBox { box1, box2, box3 }

enum Menu { Soccer, Hiking, Volleyball, Basketball, Tennis }

class CreateGameCtrl extends GetxController {
  RxString selectedMenu = ''.obs;
  Rx<TimeOfDay> time = TimeOfDay.now().obs;
  Rx<SelectedBox> selectedBox = SelectedBox.box1.obs;
  Rx<Menu> menu = Menu.Soccer.obs;
  Rx<DateTime> date = DateTime.now().obs;
  RxInt currentPartnersNeeded = 0.obs;
}

class SPMCreateGame extends GetView<CreateGameCtrl> {
  const SPMCreateGame({Key? key}) : super(key: key);

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
                const SPMHeader(),
                const SizedBox(height: 30),
                SPMDate(controller: controller, date: date),
                const SizedBox(height: 20),
                SPMTime(controller: controller),
                const SizedBox(height: 20),
                SPMLevel(controller: controller, date: date),
                const SizedBox(height: 20),
                const SPMPlace(),
                const SizedBox(height: 20),
                SPMPartners(controller: controller),
                const SizedBox(height: 20),
                const SPMDescription(),
                const SizedBox(height: 20),
                const SelectButton(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
