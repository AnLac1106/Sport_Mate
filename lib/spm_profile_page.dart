import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_select_box.dart';
import 'package:sport_mate/function/spm_status_box.dart';

enum Select1 { myGame, rating }

enum Select2 { history, upcoming }

enum Menu { online, offline, away }

class SPMProfilePageCtrl extends GetxController {
  Rx<Select1> select1 = Select1.myGame.obs;
  Rx<Select2> select2 = Select2.history.obs;
  RxString selectedItem = ''.obs;
}

class SPMProfilePage extends GetView<SPMProfilePageCtrl> {
  const SPMProfilePage({Key? key}) : super(key: key);

  @override
  SPMProfilePageCtrl get controller => Get.put(SPMProfilePageCtrl());

  @override
  Widget build(BuildContext context) {
    var slt1 = controller.select1;
    var slt2 = controller.select2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: const Text('My Profile', style: TextStyle(color: SPMColors.primaryColor),),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_new),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avatar1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const Positioned(
                    top: 0,
                    right: 0,
                    child: SPMStatusBox(),
                    ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Nguyễn Đức Thiện'),
            const SizedBox(
              height: 3,
            ),
            const Text('Professional'),
            const SizedBox(
              height: 3,
            ),
            const Text('Tell about yourself..........'),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('5 followers'),
                SizedBox(
                  width: 30,
                ),
                Text('10 following'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () => TextButton(
                      onPressed: () {
                        slt1.value = Select1.myGame;
                      },
                      child: Text(
                        'My Games',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: slt1.value == Select1.myGame
                              ? Colors.black
                              : Colors.black26,
                        ),
                      )),
                ),
                Obx(
                  () => TextButton(
                    onPressed: () {
                      slt1.value = Select1.rating;
                    },
                    child: Text(
                      'Rating',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: slt1.value == Select1.rating
                            ? Colors.black
                            : Colors.black26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(() {
              if (slt1.value == Select1.myGame) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SPMSelectBox(
                          onTap: () {
                            slt2.value = Select2.history;
                          },
                          width: 130,
                          height: 40,
                          borderRadius: 10,
                          color: slt2.value == Select2.history
                              ? SPMColors.primaryColor
                              : Colors.white,
                          borderColor: slt2.value == Select2.history
                              ? SPMColors.primaryColor
                              : Colors.grey,
                          child: const Text('History'),
                        ),
                        SPMSelectBox(
                          onTap: () {
                            slt2.value = Select2.upcoming;
                          },
                          width: 130,
                          height: 40,
                          borderRadius: 10,
                          color: slt2.value == Select2.upcoming
                              ? SPMColors.primaryColor
                              : Colors.white,
                          borderColor: slt2.value == Select2.upcoming
                              ? SPMColors.primaryColor
                              : Colors.grey,
                          child: const Text('Upcoming'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xffEBEBEB), width: 3),
                        ),
                        clipBehavior: Clip.hardEdge,
                        height: 200,
                        width: Get.width,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) =>
                                    SlideTransition(
                              position: Tween(
                                begin: const Offset(1.0, 0.0),
                                end: const Offset(0.0, 0.0),
                              ).animate(animation),
                              child: child,
                            ),
                            child: slt2.value == Select2.history
                                ? SingleChildScrollView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 18,
                                              height: 18,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      spreadRadius: 1)
                                                ],
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/football.png'),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            const Text(
                                                'Hanoi University of Science and Technology'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 24,
                                            ),
                                            const Text('With: '),
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                minimumSize: Size.zero,
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                              ),
                                              child: const Text('Quang Hải'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 24,
                                            ),
                                            Text(
                                              DateFormat('dd/MM/yyyy, HH:mm')
                                                  .format(DateTime.now()),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                // : Container(color: Colors.green,)
                                : Container(
                                    child: SingleChildScrollView(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 12),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 18,
                                                height: 18,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.green,
                                                        spreadRadius: 1)
                                                  ],
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/football.png'),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              const Text('Mỹ Đình stadium'),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 24,
                                              ),
                                              const Text('With: '),
                                              TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  minimumSize: Size.zero,
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                ),
                                                child: const Text('Neymar JR'),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 24,
                                              ),
                                              Text(
                                                DateFormat('dd/MM/yyyy, HH:mm')
                                                    .format(DateTime.now()),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        )),
                  ],
                );
              }
              return SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(color: const Color(0xffEBEBEB))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            const SPMAvatarBox(
                              image: NetworkImage('https://i.pravatar.cc/128'),
                              diameter: 55,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Messi'),
                                  Row(
                                    children: const [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                    ],
                                  ),
                                  const Text(
                                      'You are an amazing player. Its my pleasure to play with you. Hope we can play again some day.'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 90,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(color: const Color(0xffEBEBEB))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            const SPMAvatarBox(
                              image: NetworkImage('https://i.pravatar.cc/128'),
                              diameter: 55,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Ronaldo'),
                                  Row(
                                    children: const [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.grey),
                                    ],
                                  ),
                                  const Text('Thanks for played with me'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 90,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(color: const Color(0xffEBEBEB))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            const SPMAvatarBox(
                              image: NetworkImage('https://i.pravatar.cc/128'),
                              diameter: 55,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Ronaldo'),
                                  Row(
                                    children: const [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.grey),
                                    ],
                                  ),
                                  const Text('Thanks for played with me'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 90,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(color: const Color(0xffEBEBEB))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            const SPMAvatarBox(
                              image: NetworkImage('https://i.pravatar.cc/128'),
                              diameter: 55,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Ronaldo'),
                                  Row(
                                    children: const [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.grey),
                                    ],
                                  ),
                                  const Text('Thanks for played with me'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
