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
                  Get.dialog(AlertDialog(
                    title: const Text('Do you want to reate this game?'),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      SPMButton(
                        color: SPMColors.primaryColor,
                        onPress: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SPMNewFeedPage()),
                              (route) => false);
                          Get.back();
                          Get.snackbar(
                            'Success!',
                            'Your game have been created',
                            backgroundColor: Colors.orange.shade100,
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 2),
                          );
                        },
                        borderColor: SPMColors.primaryColor,
                        child: const Text('OK'),
                      ),
                      SPMButton(
                        color: Colors.white,
                        onPress: () {
                          Get.back();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ));
                },
                // onPressed: () {
                //   debugPrint('Move to New Feed');
                //   Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const SPMNewFeedPage()),
                //       (route) => false);
                // },
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
