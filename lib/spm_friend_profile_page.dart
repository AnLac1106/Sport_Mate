import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_avatar.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_select_box.dart';
import 'package:sport_mate/common/spm_text_style.dart';

class SPMFriendProfileCtrl extends GetxController {}

class SPMFriendProfilePage extends GetView<SPMFriendProfileCtrl> {
  const SPMFriendProfilePage({Key? key}) : super(key: key);

  @override
  SPMFriendProfileCtrl get controller => Get.put(SPMFriendProfileCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text('My Profile'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.black)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SPMAvatar(
                radius: 50,
                height: 100,
                width: 100,
                name: 'assets/images/avatar1.jpg',
              ),
              const SizedBox(height: 10),
              Text(
                'Nguyễn Đức Thiện',
                style: textStyleHeading4.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Text('Professional',
                  style: textStyleNormal.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('Tell about yourself..........'),
              const SizedBox(height: 3),
              const Text('vsco.co/sinemkocasu'),
              const SizedBox(height: 3),
              const Text('instagram.com/sinemkocasu'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Point',
                        style: textStyleNormal.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      SPMSelectBox(
                          borderColor: Colors.transparent,
                          color: SPMColors.primaryColor,
                          width: 120,
                          height: 40,
                          borderRadius: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.grade,
                                color: Colors.yellow,
                                size: 30,
                              ),
                              Text(
                                '4.7/5',
                                style: textStyleNormal.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Game Played',
                        style: textStyleNormal.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      SPMSelectBox(
                          borderColor: Colors.transparent,
                          color: SPMColors.primaryColor,
                          width: 120,
                          height: 40,
                          borderRadius: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.sports_tennis,
                                color: Colors.yellow,
                                size: 30,
                              ),
                              Text(
                                '50',
                                style: textStyleNormal.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: ((context, index) => Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey, width: 1.0))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const SPMAvatar(
                                  height: 60, width: 60, radius: 40),
                              const SizedBox(width: 16),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      'Anonim 1',
                                      style: textStyleNormal,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 24,
                                      itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber),
                                      onRatingUpdate: (rating) {
                                        debugPrint('$rating');
                                      },
                                    ),
                                    const Text('Lorem ipsum dolor sit amet'),
                                    //To do: Chữ ko tự động xuống dòng được.
                                  ])
                            ]),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
