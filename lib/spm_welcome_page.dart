import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/hide_keyboard.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_select_box.dart';
import 'package:sport_mate/common/spm_text_field.dart';
import 'package:sport_mate/spm_register_page.dart';
import 'common/spm_button.dart';

enum SelectedBox { box1, box2, box3 }

class WelcomePageCtrl extends GetxController {
  Rx<SelectedBox> selectedBox = SelectedBox.box1.obs;
  RxBool isObscure = true.obs;
  FocusNode f1 = FocusNode();
  Rx<FocusNode> f2 = FocusNode().obs;
}

class SPMWelcomePage extends GetView<WelcomePageCtrl> {
  const SPMWelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageCtrl get controller => Get.put<WelcomePageCtrl>(WelcomePageCtrl());

  @override
  Widget build(context) {
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
                              children: [
                                Text('Welcome!',
                                    style: Get.textTheme.headline4),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text('Please login with your information',
                                    style: Get.textTheme.bodyText1)
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            SPMTextField(
                              // controller: TextEditingController(),
                              maxLine: 1,
                              focusNode: controller.f2.value,
                              labelText: 'Email Address',
                              suffixIcon: controller.f2.value.hasFocus
                                  ? IconButton(
                                      iconSize: 15,
                                      onPressed: () {
                                        // TextEditingController().clear();
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
                                  maxLine: 1,
                                  obscureText: controller.isObscure.value,
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.isObscure.value =
                                            !controller.isObscure.value;
                                      },
                                      icon: Icon(controller.isObscure.value
                                          ? Icons.visibility
                                          : Icons.visibility_off))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forgot password',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.black,
                                          decorationThickness: 1.5,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SPMButton(
                                  borderRadius: 20,
                                  color: SPMColors.secondaryColor,
                                  // text: 'Login',
                                  textColor: Colors.white,
                                  width: 225,
                                  height: 48,
                                  onPress: () {},
                                  child: const Text('Login'),
                                ),
                              ],
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
                                    borderRadius: 20,
                                    child: Text('test1'),
                                  ),
                                ),
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
                                    borderRadius: 20,
                                    child: Text('test1'),
                                  ),
                                ),
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
                                    borderRadius: 20,
                                    child: Text('test1'),
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have any account? ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(const SPMRegisterPage());
                                  },
                                  child: const Text(
                                    'Register now',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
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
