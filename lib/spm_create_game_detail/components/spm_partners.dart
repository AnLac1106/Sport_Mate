import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';

class SPMPartners extends GetView<CreateGameCtrl> {
  const SPMPartners({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  final CreateGameCtrl controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Partners needed",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Obx(() => NumberPicker(
                      selectedTextStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      itemHeight: 50,
                      itemWidth: 50,
                      itemCount: 1,
                      axis: Axis.horizontal,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(8)),
                      minValue: 0,
                      maxValue: 100,
                      value: controller.currentPartnersNeeded.value,
                      onChanged: (value) {
                        controller.currentPartnersNeeded.value = value;
                      }))
                ])));
  }
}
