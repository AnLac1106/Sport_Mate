import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
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
        foregroundColor: Colors.black,
        elevation: 0.0,
        // title: const Text('Friend Profile'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SPMAvatarBox(
                diameter: 90, image: AssetImage('assets/images/avatar1.jpg')),
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
            SizedBox(
              height: 340,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: ((context, index) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey, width: 1.0))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SPMAvatarBox(
                                  diameter: 50,
                                  image: AssetImage(
                                      'assets/images/spm_test_avatar.png')),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      const Text(
                                          'Lorem ipsum dolor Lorem ipsum dolor sit amet'),
                                      //TODO: Chữ ko tự động xuống dòng được.
                                    ]),
                              )
                            ]),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
