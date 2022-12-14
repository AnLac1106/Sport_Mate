import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_text_style.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';
import 'package:sport_mate/spm_friend_profile_page.dart';
import 'package:sport_mate/spm_main_home_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';

class SPMCreateGamePage extends GetView<MainHomePageCtrl> {
  const SPMCreateGamePage({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
            child: Column(
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/spm_logo.png')),
                const Text('SPORTMATE', style: textStyleHeading1),
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
                          // controller.selectedHomeIndex.value = spmCreateGameIndex;
                          // Get.to(SPMCreateGame());
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const SPMCreateGameDetail()));
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
                                  'assets/images/spm_create.png'),
                            ),
                            color: SPMColors.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 4, color: const Color(0xFFF1F1F1)),
                          ),
                          child: const Text("Create Game",
                              textAlign: TextAlign.center,
                              style: textStyleHeading4),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() {
                          debugPrint('Join Game');
                          // Get.to(const SPMNewFeedPage());
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SPMNewFeedPage()),
                              (route) => false);
                        }),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.bottomCenter,
                          height: 210,
                          width: 150,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              scale: 4.0,
                              image:
                                  ExactAssetImage('assets/images/spm_join.png'),
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 4, color: const Color(0xFFF1F1F1)),
                          ),
                          child: const Text("Join Game",
                              textAlign: TextAlign.center,
                              style: textStyleHeading4),
                        ),
                      ),
                    ]),
                const SizedBox(height: 50),
                Text("Upcoming Games",
                    textAlign: TextAlign.right,
                    style: textStyleHeading4.copyWith(
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                inforCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inforCard(BuildContext context) {
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.zero,
        ),
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
                  style: textStyleNormal.copyWith(fontWeight: FontWeight.bold)),
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
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const SPMFriendProfilePage()));
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
        ),
      ),
    );
  }
}
