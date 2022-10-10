import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';

class SPMTime extends GetView<CreateGameCtrl> {
  const SPMTime({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  final CreateGameCtrl controller;

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
          children: [
            const Text(
              "Time",
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
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        TimeOfDay? newTime = await showTimePicker(
                            initialEntryMode: TimePickerEntryMode.input,
                            context: context,
                            initialTime: controller.time.value);
                        if (newTime != null) {
                          controller.time.value = newTime;
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(controller.time.value.format(context),
                                    // '${controller.time.value.hour.toString()} : ${controller.time.value.minute.ceil()}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: 35,
                                )
                              ])),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
