import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sport_mate/common/spm_button.dart';
import 'package:sport_mate/common/spm_colors.dart';

class NewFeedPageCtrl extends GetxController {}

class SPMNewFeedPage extends GetView<NewFeedPageCtrl> {
  const SPMNewFeedPage({Key? key}) : super(key: key);

  @override
  NewFeedPageCtrl get controller => Get.put(NewFeedPageCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatar1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xffeff3f7)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xffeff3f7)),
                        ),
                        isDense: true,
                        filled: true,
                        fillColor: const Color(0xffeff3f7),
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                itemBuilder: (context, index) => buildItem(),
                itemCount: 10,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/avatar2.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.green, spreadRadius: 1.5)
                            ],
                            image: DecorationImage(
                                image: AssetImage('assets/images/football.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text('Nguyễn Đức Thiện', style: Get.textTheme.bodyText1,),
                      Text(
                        DateFormat('dd/MM/yyyy, HH:mm')
                            .format(DateTime.now())
                            .toString(), style: Get.textTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: Text(
                        "Team văn phòng cần tìm đối đá vui vẻ, sân nước chia đôi. Đã đặt sân, tổng sân nước 700k",
                    style: Get.textTheme.bodyText1,),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(
                    Icons.thumb_up,
                    color: Colors.blueAccent,
                    size: 16,
                  ),
                  Text('  7', style: Get.textTheme.bodyText1,),
                  const Expanded(child: SizedBox()),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '2 comments',
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Column(
                          children: [const Icon(Icons.thumb_up), Text('Like', style: Get.textTheme.bodyText1,)],
                        ),
                      ),
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            const Icon(Icons.comment),
                            Text('Comment', style: Get.textTheme.bodyText1,),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        // alignment: Alignment.center,
                        onPressed: () {},
                        child: Column(
                          children: [
                            const Icon(Icons.turn_right),
                            Text('Share', style: Get.textTheme.bodyText1,)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SPMButton(
                          color: SPMColors.primaryColor,
                          borderColor: SPMColors.primaryColor,
                          onPress: () {},
                          child: Text(
                            'Request game',
                            style: Get.textTheme.bodyText1,
                          )),
                    ),
                    const SizedBox(width: 15,),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: const Color(0xffe9e6e0),
          height: 5,
        ),
      ],
    );
  }
}
