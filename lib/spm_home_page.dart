import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/spm_create_game.dart';

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
            padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
            child: Column(
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/SPM_logo.png')),
                Text('sportmate',
                    style:
                        Get.textTheme.headline1?.copyWith(color: Colors.black)),
                const SizedBox(height: 30),
                Text('Hello partners!', style: Get.textTheme.bodyText1),
                const SizedBox(height: 30),
                Text('What do you want to play?',
                    style: Get.textTheme.headline4),
                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          debugPrint('Start Game');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SPMCreateGame(),
                            ),
                          );
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
                                width: 4, color: const Color(0xFFF1F1F1)),
                          ),
                          child: Text("Create Game",
                              textAlign: TextAlign.center,
                              style: Get.textTheme.headline4?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
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
                              image:
                                  ExactAssetImage('assets/images/SPM_join.png'),
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 4, color: const Color(0xFFF1F1F1)),
                          ),
                          child: Text("Join Game",
                              textAlign: TextAlign.center,
                              style: Get.textTheme.headline4?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ]),
                const SizedBox(height: 30),
                Text("Upcoming Games",
                    textAlign: TextAlign.right, style: Get.textTheme.headline4),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => inforCard(),
                  itemCount: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                title: Text(
                  "Hanoi University of Science and Technology",
                  style: Get.textTheme.headline4?.copyWith(
                      // overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sept 29, 2021 & 12:10",
                        style: Get.textTheme.bodyText1),
                    RichText(
                      text: TextSpan(
                        text: 'with: ',
                        style: Get.textTheme.bodyText1,
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
