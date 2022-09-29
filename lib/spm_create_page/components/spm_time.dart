import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/spm_create_page/spm_create_game.dart';

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
      height: 150,
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
            Obx(() => TextButton(
                  onPressed: () async {
                    TimeOfDay? newTime = await showTimePicker(
                        initialEntryMode: TimePickerEntryMode.input,
                        context: context,
                        initialTime: controller.time.value);
                    if (newTime != null) {
                      controller.time.value = newTime;
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              controller.time.value.hour.toString(),
                              style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Image.asset(
                              'assets/images/spmsort.png',
                              scale: 4.0,
                            )
                          ],
                        ),
                      ),
                      const Text(
                        " : ",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              controller.time.value.minute.toString(),
                              style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Image.asset(
                              'assets/images/spmsort.png',
                              scale: 4.0,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
