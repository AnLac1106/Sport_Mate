import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/hide_keyboard.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_text_field.dart';
import 'package:sport_mate/common/spm_text_style.dart';
import 'package:sport_mate/sm_navigatorbar.dart';
import 'package:sport_mate/spm_register_page.dart';
import 'package:sport_mate/transition/scale_route.dart';
import 'common/spm_button.dart';


class WelcomePageCtrl extends GetxController {
  RxBool isObscure = true.obs;
  FocusNode f1 = FocusNode();
  Rx<FocusNode> f2 = FocusNode().obs;
  // String inputEmail = '';
  // String inputPassword = '';
}

class SPMWelcomePage extends GetView<WelcomePageCtrl> {
  SPMWelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageCtrl get controller => Get.put<WelcomePageCtrl>(WelcomePageCtrl());
  RegisterPageCtrl get controller1 =>
      Get.put<RegisterPageCtrl>(RegisterPageCtrl());

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
  }

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
                              children: const [
                                Text('Welcome!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: const [
                                Text('Please login with your information', style: TextStyle(fontSize: 18),)
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            SPMTextField(
                              controller: emailTextController,
                              focusNode: controller.f1,
                              maxLine: 1,
                              labelText: 'Email Address',
                              suffixIcon: controller.f1.hasFocus
                                  ? IconButton(
                                iconSize: 15,
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
                                controller: passwordTextController,
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
                                  textColor: Colors.white,
                                  width: 225,
                                  height: 48,
                                  onPress: () {
                                    if (emailTextController.text ==
                                            controller1.userEmail &&
                                        passwordTextController.text ==
                                            controller1.userPassWord) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          ScaleRoute(
                                              page: const BottomBarPage()),
                                          (route) => false);
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title:
                                                  Text('error!'.toUpperCase()),
                                              content: SizedBox(
                                                height: 50,
                                                child: Column(
                                                  children: const [
                                                    Text(
                                                        "Email or Password is not correct"),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                SPMButton(
                                                  color:
                                                      SPMColors.secondaryColor,
                                                  child: const Text('OK'),
                                                  // text: 'OK',
                                                  onPress: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  child: const Text('Login',style: TextStyle(fontSize: 18),),
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
                                    Get.to(SPMRegisterPage());
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
