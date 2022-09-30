import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_select_box.dart';

// enum SelectedBox { box1, box2, box3 }

class SPMLevel extends GetView<CreateGameCtrl> {
  const SPMLevel({
    Key? key,
    required this.controller,
    required this.date,
  }) : super(key: key);

  @override
  final CreateGameCtrl controller;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text(
                    "Level",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 320,
                      height: 1,
                      color: Colors.black38,
                    ),
                  ),
                  Row(
                    children: [
                      Obx(
                        () => SPMSelectBox(
                          onTap: () {
                            controller.selectedBox.value = SelectedBox.box1;
                          },
                          color: controller.selectedBox.value.toString() ==
                                  SelectedBox.box1.toString()
                              ? SPMColors.primaryColor
                              : Colors.white,
                          borderColor:
                              controller.selectedBox.value.toString() ==
                                      SelectedBox.box1.toString()
                                  ? SPMColors.primaryColor
                                  : Colors.grey,
                          width: controller.selectedBox.toString().isNotEmpty
                              ? 100
                              : 100,
                          height: 50,
                          borderRadius: 8,
                          child: const Text('Beginner',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Obx(
                        () => SPMSelectBox(
                          onTap: () {
                            controller.selectedBox.value = SelectedBox.box2;
                          },
                          color: controller.selectedBox.value.toString() ==
                                  SelectedBox.box2.toString()
                              ? SPMColors.primaryColor
                              : Colors.white,
                          borderColor:
                              controller.selectedBox.value.toString() ==
                                      SelectedBox.box2.toString()
                                  ? SPMColors.primaryColor
                                  : Colors.grey,
                          width: controller.selectedBox.toString().isNotEmpty
                              ? 100
                              : 100,
                          height: 50,
                          borderRadius: 8,
                          child: const Text('Intermediate',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Obx(
                        () => SPMSelectBox(
                          onTap: () {
                            controller.selectedBox.value = SelectedBox.box3;
                          },
                          color: controller.selectedBox.value.toString() ==
                                  SelectedBox.box3.toString()
                              ? SPMColors.primaryColor
                              : Colors.white,
                          borderColor:
                              controller.selectedBox.value.toString() ==
                                      SelectedBox.box3.toString()
                                  ? SPMColors.primaryColor
                                  : Colors.grey,
                          width: controller.selectedBox.toString().isNotEmpty
                              ? 100
                              : 100,
                          height: 50,
                          borderRadius: 8,
                          child: const Text('Professional',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ])));
  }
}
