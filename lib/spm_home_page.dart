import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_text_style.dart';
import 'package:sport_mate/SPM_Creat_page/spm_create_game.dart';
import 'package:sport_mate/spm_main_home_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';
import 'package:sport_mate/common/spm_page_const.dart';

class SPMHomePage extends GetView<MainHomePageCtrl> {
  const SPMHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: controller.selectedHomeIndex.value == spmHomePageIndex
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/SPM_logo.png')),
                        const Text('sportmate', style: textStyleHeading1),
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
                                onTap: (() {
                                  debugPrint('Start Game');
                                  controller.selectedHomeIndex.value =
                                      spmCreateGameIndex;

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const SPMCreateGame(),
                                  //   ),
                                  // );
                                }),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  alignment: Alignment.bottomCenter,
                                  height: 210,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      scale: 4.0,
                                      image: ExactAssetImage(
                                          'assets/images/SPM_create.png'),
                                    ),
                                    color: SPMColors.primaryColor,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: 4,
                                        color: const Color(0xFFF1F1F1)),
                                  ),
                                  child: const Text("Create Game",
                                      textAlign: TextAlign.center,
                                      style: textStyleHeading4),
                                ),
                              ),
                              GestureDetector(
                                onTap: (() {
                                  debugPrint('Join Game');
                                }),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  alignment: Alignment.bottomCenter,
                                  height: 210,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      scale: 4.0,
                                      image: ExactAssetImage(
                                          'assets/images/SPM_join.png'),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: 4,
                                        color: const Color(0xFFF1F1F1)),
                                  ),
                                  child: const Text("Join Game",
                                      textAlign: TextAlign.center,
                                      style: textStyleHeading4),
                                ),
                              ),
                            ]),
                        const SizedBox(height: 30),
                        const Text("Upcoming Games",
                            textAlign: TextAlign.right,
                            style: textStyleHeading4),
                        inforCard(),
                      ],
                    ),
                  ),
                )
              : controller.selectedHomeIndex.value == spmCreateGameIndex
                  ? const SPMCreateGame()
                  : const SPMNewFeedPage()),
    ));
  }

  Widget inforCard() {
    return Card(
      color: Colors.white,
      shadowColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black12, width: 3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.zero,
        ),
      ),
      child: InkWell(
          splashColor: SPMColors.primaryColor.withAlpha(80),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: Container(
            height: 120,
            width: 330,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.zero,
              ),
              border: Border.all(width: 3, color: Colors.black12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(Icons.pin_drop,
                    color: SPMColors.secondaryColor, size: 32),
                title: Text("Hanoi University of Science and Technology",
                    style:
                        textStyleNormal.copyWith(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sept 29, 2021 & 12:10", style: textStyleNormal),
                    RichText(
                      text: TextSpan(
                        text: 'with: ',
                        style: textStyleNormal,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sinem Kocasu',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  debugPrint("Move to Friend page");
                                },
                              style: const TextStyle(
                                  fontSize: 16, color: Color(0xff009688))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
