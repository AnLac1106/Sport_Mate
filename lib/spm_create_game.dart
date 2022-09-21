import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sport_mate/common/spm_avatar.dart';
import 'package:sport_mate/common/spm_button.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_select_box.dart';
import 'package:sport_mate/common/spm_text_field.dart';
import 'package:sport_mate/spm_home_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';

enum SelectedBox { box1, box2, box3 }

class CreateGameCtrl extends GetxController {
  late Rx newTime = 24.obs;
  Rx<TimeOfDay> time = TimeOfDay.now().obs;
  Rx<SelectedBox> selectedBox = SelectedBox.box1.obs;
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
                Container(
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
                                        controller.selectedBox.value =
                                            SelectedBox.box1;
                                      },
                                      color: controller.selectedBox.value
                                                  .toString() ==
                                              SelectedBox.box1.toString()
                                          ? SPMColors.primaryColor
                                          : Colors.white,
                                      borderColor: controller.selectedBox.value
                                                  .toString() ==
                                              SelectedBox.box1.toString()
                                          ? SPMColors.primaryColor
                                          : Colors.grey,
                                      width: controller.selectedBox
                                              .toString()
                                              .isNotEmpty
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
                                        controller.selectedBox.value =
                                            SelectedBox.box2;
                                      },
                                      color: controller.selectedBox.value
                                                  .toString() ==
                                              SelectedBox.box2.toString()
                                          ? SPMColors.primaryColor
                                          : Colors.white,
                                      borderColor: controller.selectedBox.value
                                                  .toString() ==
                                              SelectedBox.box2.toString()
                                          ? SPMColors.primaryColor
                                          : Colors.grey,
                                      width: controller.selectedBox
                                              .toString()
                                              .isNotEmpty
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
                                        controller.selectedBox.value =
                                            SelectedBox.box3;
                                      },
                                      color: controller.selectedBox.value
                                                  .toString() ==
                                              SelectedBox.box3.toString()
                                          ? SPMColors.primaryColor
                                          : Colors.white,
                                      borderColor: controller.selectedBox.value
                                                  .toString() ==
                                              SelectedBox.box3.toString()
                                          ? SPMColors.primaryColor
                                          : Colors.grey,
                                      width: controller.selectedBox
                                              .toString()
                                              .isNotEmpty
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
                            ]))),
                const SizedBox(height: 20),
                const SPMPlace(),
                const SizedBox(height: 20),
                SPMPartners(controller: controller),
                const SizedBox(height: 20),
                Container(
                    width: 350,
                    height: 200,
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
                                "Description",
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
                              const SPMTextField(
                                maxLine: 4,
                                hintText: 'Description about your game',
                                expands: true,
                              )
                            ]))),
                const SizedBox(height: 20),
                const CreatGame(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreatGame extends StatelessWidget {
  const CreatGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SPMButton(
              width: 100,
              height: 50,
              color: SPMColors.primaryColor,
              onPress: () {},
              child: TextButton(
                onPressed: () {
                  debugPrint('Move to New Feed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SPMNewFeedPage(),
                    ),
                  );
                },
                child: const Text('Create',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )),
          SPMButton(
              width: 100,
              height: 50,
              color: Colors.white,
              onPress: () {},
              child: TextButton(
                onPressed: () {
                  debugPrint('Back to Home Page');
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SPMHomePage(),
                    ),
                  );
                },
                child: const Text('Cancel',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              )),
        ]);
  }
}

class SPMPartners extends StatelessWidget {
  const SPMPartners({
    Key? key,
    required this.controller,
  }) : super(key: key);

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

class SPMDate extends StatelessWidget {
  const SPMDate({
    Key? key,
    required this.controller,
    required this.date,
  }) : super(key: key);

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
                        fontSize: 14,
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
                                        context: context,
                                        initialDate: controller.date.value,
                                        firstDate: DateTime(2000),
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

class SPMTime extends StatelessWidget {
  const SPMTime({
    Key? key,
    required this.controller,
  }) : super(key: key);

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
                        context: context, initialTime: controller.time.value);
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
                              'assets/images/SPMsort.png',
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
                              'assets/images/SPMsort.png',
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

class SPMPlace extends StatelessWidget {
  const SPMPlace({
    Key? key,
  }) : super(key: key);

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
                    "Place",
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
                  const SPMTextField(
                    maxLine: 1,
                    hintText:
                        'Football Stadium, Hanoi University, Nguyen Trai Street',
                  ),
                ])));
  }
}

class SPMHeader extends GetView {
  const SPMHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: (() {
            debugPrint('Select Sport');
          }),
          child: Container(
            height: 80,
            width: 100,
            decoration: const BoxDecoration(
              color: SPMColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.circular(100),
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SPMAvatar(
                  radius: 60,
                  name: 'assets/images/football.png',
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (() {
            debugPrint('Move to Profife Page');
          }),
          child: Container(
            height: 80,
            width: 100,
            decoration: const BoxDecoration(
              color: SPMColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.zero,
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.zero,
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [SPMAvatar(radius: 60)]),
          ),
        ),
      ],
    );
  }
}
