import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_button.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/spm_create_game_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';

class SelectButton extends GetView {
  const SelectButton({
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
                  // Get.find<MainHomePageCtrl>().selectedHomeIndex.value =
                  //     spmNewFeedPageIndex;
                  // Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //         builder: (context) => const SPMNewFeedPage()));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SPMNewFeedPage()),
                      (route) => false);
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
                      builder: (context) => const SPMCreateGamePage(),
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
