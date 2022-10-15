import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/hide_keyboard.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/common/spm_button.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_select_button.dart';
import 'package:sport_mate/common/spm_text_field.dart';
import 'package:sport_mate/common/spm_text_style.dart';
import 'package:sport_mate/spm_create_game_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';
import 'package:sport_mate/spm_profile_page.dart';
import 'package:sport_mate/spm_register_page.dart';
import 'package:sport_mate/transition/scale_route.dart';

class SPMUpdateInfor extends GetView<RegisterPageCtrl> {
  const SPMUpdateInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          hideKeyBoardAndUnFocus(BuildContext, context);
        },
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Container(
                color: SPMColors.primaryColor,
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                    padding: const EdgeInsets.all(56.0),
                    child: Stack(
                      children: const [
                        SPMAvatarBox(
                            diameter: 100,
                            image: NetworkImage(
                                'http://thuvienhinhanh.net/wp-content/uploads/2016/05/anh-avatar-dep-den-chat-cap-cho-facebook-tuong-doc-dao-nhat3.jpg')),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Icon(Icons.add_a_photo_outlined,
                              color: Colors.white),
                        )
                      ],
                    ))),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white.withOpacity(0),
                      padding: const EdgeInsets.only(top: 215),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 42, right: 42, top: 42),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text('Update Profile!',
                                    style: textStyleHeading4),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: const [
                                Text('Please select the appropriate',
                                    style: textStyleNormal)
                              ],
                            ),
                            const SizedBox(height: 32),
                            SPMTextField(
                              focusNode: controller.f1,
                              labelText: 'Email Address',
                              suffixIcon: controller.f1.hasFocus
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.clear),
                                    )
                                  : null,
                            ),
                            const SizedBox(height: 32),
                            Obx(
                              () => SPMTextField(
                                focusNode: controller.f2,
                                maxLine: 1,
                                obscureText: controller.isObscure1.value,
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.isObscure1.value =
                                        !controller.isObscure1.value;
                                  },
                                  icon: Icon(controller.isObscure1.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Obx(
                              () => SPMTextField(
                                focusNode: controller.f3,
                                maxLine: 1,
                                obscureText: controller.isObscure2.value,
                                labelText: 'Confirm Password',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.isObscure2.value =
                                        !controller.isObscure2.value;
                                  },
                                  icon: Icon(controller.isObscure2.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                            title: const Text(
                                                'Do you want to update your profile?'),
                                            actionsAlignment:
                                                MainAxisAlignment.center,
                                            actions: [
                                              SPMButton(
                                                color: SPMColors.primaryColor,
                                                onPress: () {
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SPMProfilePage()),
                                                      (route) => false);
                                                  Get.back();
                                                  Get.snackbar(
                                                    'Success!',
                                                    'Your profile have been saved!',
                                                    backgroundColor:
                                                        Colors.orange.shade100,
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    duration: const Duration(
                                                        seconds: 2),
                                                  );
                                                },
                                                borderColor:
                                                    SPMColors.primaryColor,
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
                                        child: const Text('Save',
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
                                          debugPrint('Back to Update Infor');
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      )),
                                ]),
                            const Expanded(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
