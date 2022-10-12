import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/hide_keyboard.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_text_field.dart';
import 'package:sport_mate/common/spm_text_style.dart';

import 'package:sport_mate/spm_welcome_page.dart';

import 'common/spm_button.dart';

class RegisterPageCtrl extends GetxController {
  RxBool isObscure1 = true.obs;
  RxBool isObscure2 = true.obs;
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  RxBool isIconVisible = false.obs;
  String userEmail = '';
  String userPassWord = '';
  String userRepeatPassWord = '';
}

class SPMRegisterPage extends GetView {
  SPMRegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageCtrl get controller => Get.put(RegisterPageCtrl(), permanent: true);

  final TextEditingController emailTextController = TextEditingController();

  void onClose() {
    emailTextController.dispose();
  }

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
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/cover3.jpg')),
            Positioned(
              top: 100,
              left: MediaQuery.of(context).size.width * 0.20,
              child: Container(
                width: 250,
                height: 50,
                alignment: Alignment.topCenter,
                // color: Colors.white.withOpacity(0.3),
                child: Image.asset('assets/images/textlogo1.png'),
              ),
            ),
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
                                Text('Register!',style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: const [
                                Text('Please select the appropriate',style: TextStyle(fontSize: 18))
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            SPMTextField(
                              onChanged: (value) {
                                controller.userEmail = emailTextController.text;
                              },
                              focusNode: controller.f1,
                              controller: emailTextController,
                              labelText: 'Email Address',
                              suffixIcon: controller.f1.hasFocus
                                  ? IconButton(
                                      onPressed: () {
                                        emailTextController.clear();
                                      },
                                      icon: const Icon(Icons.clear),
                                    )
                                  : null,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Obx(
                              () => SPMTextField(
                                onChanged: (value) {
                                  controller.userPassWord = value;
                                },
                                // focusNode: controller.f2,
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
                            const SizedBox(
                              height: 32,
                            ),
                            Obx(
                              () => SPMTextField(
                                onChanged: (value) {
                                  controller.userRepeatPassWord = value;
                                },
                                // focusNode: controller.f3,
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
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SPMButton(
                                  borderRadius: 20,
                                  color: SPMColors.secondaryColor,
                                  // text: 'Register',
                                  textColor: Colors.white,
                                  width: 225,
                                  height: 48,
                                  onPress: () {
                                    // print(controller.userEmail);
                                    // print(controller.userPassWord);
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          if (emailTextController.text.isEmpty ||
                                              (controller
                                                      .userPassWord.isEmpty &&
                                                  controller.userRepeatPassWord
                                                      .isEmpty)) {
                                            return AlertDialog(
                                              title:
                                                  Text('error!'.toUpperCase()),
                                              content: SizedBox(
                                                height: 50,
                                                child: Column(
                                                  children: const [
                                                    Text(
                                                        "Requirement field can not be empty!"),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                SPMButton(
                                                  color:
                                                      SPMColors.secondaryColor,
                                                  child: const Text('OK'),
                                                  onPress: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ],
                                            );
                                          } else if (controller.userPassWord !=
                                              controller.userRepeatPassWord) {
                                            return AlertDialog(
                                              title:
                                                  Text('error!'.toUpperCase()),
                                              content: SizedBox(
                                                height: 50,
                                                child: Column(
                                                  children: const [
                                                    Text(
                                                        "Password is not matched!"),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                SPMButton(
                                                  color:
                                                      SPMColors.secondaryColor,
                                                  child: const Text('OK'),
                                                  onPress: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ],
                                            );
                                          }
                                          return AlertDialog(
                                            title:
                                                Text('Success!'.toUpperCase()),
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
                                                      "Tap 'OK' to return to Login Page"),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              SPMButton(
                                                color: SPMColors.secondaryColor,
                                                child: const Text('OK'),
                                                onPress: () {
                                                  Get.offAll(
                                                      SPMWelcomePage());
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Text('Register', style: TextStyle(fontSize: 18),),
                                ),
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
