import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sport_mate/common/hide_keyboard.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_select_box.dart';
import 'package:sport_mate/common/spm_text_field.dart';
import 'package:sport_mate/common/spm_text_style.dart';
import 'package:sport_mate/spm_register_page.dart';

import 'common/spm_button.dart';

class SPMWelcomePage extends StatefulWidget {
  const SPMWelcomePage({Key? key}) : super(key: key);

  @override
  State<SPMWelcomePage> createState() => _SPMWelcomePageState();
}

enum SelectedBox { box1, box2, box3 }

class _SPMWelcomePageState extends State<SPMWelcomePage> {
  bool isObscure1 = true;
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  SelectedBox? selectedBox;

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
                // const Text(
                //   'SPORT MATE',
                //   style: TextStyle(
                //     fontWeight: FontWeight.w400,
                //     fontSize: 32,
                //     color: Colors.blueAccent
                //   ),
                // ),
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
                                Text(
                                  'Welcome!',
                                  style: textStyleHeading1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Please login with your information',
                                  style: textStyleNormal,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            SPMTextField(
                              // controller: TextEditingController(),
                              maxLine: 1,
                              focusNode: f1,
                              labelText: 'Email Address',
                              suffixIcon: f1.hasFocus
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
                            SPMTextField(
                              focusNode: f2,
                              maxLine: 1,
                              obscureText: isObscure1,
                              labelText: 'Password',
                              suffixIcon: f2.hasFocus
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isObscure1 = !isObscure1;
                                        });
                                      },
                                      icon: Icon(isObscure1
                                          ? Icons.visibility
                                          : Icons.visibility_off))
                                  : null,
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
                                  text: 'Login',
                                  textColor: Colors.white,
                                  width: 225,
                                  height: 48,
                                  onPress: () {},
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SPMSelectBox(
                                  onTap: () {
                                    setState(() {
                                      selectedBox = SelectedBox.box1;
                                    });
                                  },
                                  color: selectedBox == SelectedBox.box1
                                      ? SPMColors.primaryColor
                                      : Colors.white,
                                  borderColor: selectedBox == SelectedBox.box1
                                      ? SPMColors.primaryColor
                                      : Colors.grey,
                                  width: 100,
                                  height: 50,
                                  borderRadius: 20,
                                  child: Text('test1'),
                                ),
                                SPMSelectBox(
                                  onTap: () {
                                    setState(() {
                                      selectedBox = SelectedBox.box2;
                                    });
                                  },
                                  color: selectedBox == SelectedBox.box2
                                      ? SPMColors.primaryColor
                                      : Colors.white,
                                  borderColor: selectedBox == SelectedBox.box2
                                      ? SPMColors.primaryColor
                                      : Colors.grey,
                                  width: 100,
                                  height: 50,
                                  borderRadius: 20,
                                  child: Text('test2'),
                                ),
                                SPMSelectBox(
                                  onTap: () {
                                    setState(() {
                                      selectedBox = SelectedBox.box3;
                                    });
                                  },
                                  color: selectedBox == SelectedBox.box3
                                      ? SPMColors.primaryColor
                                      : Colors.white,
                                  borderColor: selectedBox == SelectedBox.box3
                                      ? SPMColors.primaryColor
                                      : Colors.grey,
                                  width: 100,
                                  height: 50,
                                  borderRadius: 20,
                                  child: Text('test3'),
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SPMRegisterPage()));
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
