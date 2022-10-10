import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/hide_keyboard.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/common/spm_button.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_select_box.dart';
import 'package:sport_mate/common/spm_select_button.dart';
import 'package:sport_mate/common/spm_text_field.dart';
import 'package:sport_mate/common/spm_text_style.dart';
import 'package:sport_mate/spm_profile_page.dart';
import 'package:sport_mate/spm_register_page.dart';
import 'package:sport_mate/spm_welcome_page.dart';
import 'package:sport_mate/transition/scale_route.dart';

class SPMUpdateInfor extends GetView<RegisterPageCtrl> {
  const SPMUpdateInfor({Key? key}) : super(key: key);

  @override
  RegisterPageCtrl get controller =>
      Get.put<RegisterPageCtrl>(RegisterPageCtrl());

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
                                'https://previews.123rf.com/images/deniskot/deniskot1208/deniskot120800040/14747331-login-button-on-keyboard-with-soft-focus.jpg')),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SPMButton(
                                    color: SPMColors.primaryColor,
                                    onPress: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Success!'.toUpperCase(),
                                              style: textStyleHeading4),
                                          content: SizedBox(
                                            height: 50,
                                            child: Column(
                                              children: const [
                                                Text(
                                                    "Your profile have been saved!"),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    "Tap 'OK' to return to Profile Page",
                                                    style: textStyleNormal),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            SPMButton(
                                              color: SPMColors.secondaryColor,
                                              child: const Text('OK'),
                                              onPress: () {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    ScaleRoute(
                                                        page:
                                                            const SPMProfilePage()),
                                                    (route) => false);
                                              },
                                            ),
                                            SPMButton(
                                              color: Colors.white,
                                              child: const Text('Cancel'),
                                              onPress: () {
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )),
                                SPMButton(
                                    color: Colors.white,
                                    onPress: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'))
                                /*SPMButton(
                                  borderRadius: 20,
                                  color: SPMColors.secondaryColor,
                                  // text: 'Register',
                                  textColor: Colors.white,
                                  width: 225,
                                  height: 48,
                                  onPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Success!'.toUpperCase(),
                                            style: textStyleHeading4),
                                        content: SizedBox(
                                          height: 50,
                                          child: Column(
                                            children: const [
                                              Text(
                                                  "Your account have been created!"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  "Tap 'OK' to return to Login Page",
                                                  style: textStyleNormal),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          SPMButton(
                                            color: SPMColors.secondaryColor,
                                            child: const Text('OK'),
                                            // text: 'OK',
                                            onPress: () {
                                              Get.offAll(
                                                  SPMWelcomePage());
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text('Register'),
                                ), */
                              ],
                            ),
                            const Expanded(
                              child: SizedBox(),
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
