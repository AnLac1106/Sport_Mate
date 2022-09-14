import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_text_style.dart';

class SPMHomePage extends GetView {
  const SPMHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
            child: Column(
              children: [
                SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/SPM_logo.png')),
                Text('sportmate',
                    style:
                        Get.textTheme.headline1?.copyWith(color: Colors.black)),
                const SizedBox(height: 30),
                const Text('Hello partners!', style: textStyleNormal),
                const SizedBox(height: 30),
                const Text('What do you want to play?',
                    style: textStyleHeading4),
                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (() {}),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.bottomCenter,
                          height: 210,
                          width: 150,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              scale: 4.0,
                              image: ExactAssetImage(
                                  'assets/images/SPM_users.png'),
                            ),
                            color: SPMColors.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 4, color: const Color(0xFFF1F1F1)),
                          ),
                          child: const Text(
                            "Star Game",
                            textAlign: TextAlign.right,
                            style: textStyleHeading4,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() {}),
                        child: Container(
                          height: 210,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 4, color: const Color(0xFFF1F1F1)),
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(height: 50),
                Text("Upcoming Games",
                    textAlign: TextAlign.right,
                    style: textStyleHeading4.copyWith(color: Colors.amber)),
                const SizedBox(height: 30),
                Container(
                  // height: 120,
                  // width: 330,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.zero,
                    ),
                    border:
                        Border.all(width: 2, color: const Color(0xFFF1F1F1)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "*  Hanoi University of Science and Technology",
                          style: textStyleHeading4,
                        ),
                        const Text("September 29, 2021 & 12:10",
                            style: textStyleNormal),
                        RichText(
                          text: TextSpan(
                            text: 'with: ',
                            style: textStyleNormal,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Sinem Kocasu',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("Move to Friend page");
                                    },
                                  style: const TextStyle(
                                      fontSize: 16, color: Color(0xff009688))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
