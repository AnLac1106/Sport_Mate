import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';
// import 'package:sport_mate/spm_create_page/spm_create_game_detail.dart';

class SPMDate extends GetView<CreateGameCtrl> {
  const SPMDate({
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
                children: <Widget>[
                  const Text(
                    "Date",
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Obx(() => TextButton(
                                  onPressed: () async {
                                    DateTime? newDate = await showDatePicker(
                                        initialEntryMode:
                                            DatePickerEntryMode.calendar,
                                        context: context,
                                        initialDate: controller.date.value,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(3000));
                                    if (newDate != null && newDate != date) {
                                      controller.date.value = newDate;
                                      // DateFormat. yMMMMEEEEd().format(newDate);
                                    }
                                  },
                                  child: Text(
                                      ' ${DateFormat.yMMMEd().format(controller.date.value.toLocal())}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                )))
                      ]),
                ])));
  }
}
