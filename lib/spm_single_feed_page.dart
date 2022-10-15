import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sport_mate/spm_friend_profile_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';

import 'common/spm_avatar_box.dart';
import 'common/spm_button.dart';
import 'common/spm_colors.dart';
import 'function/photo_builder.dart';
import 'function/spm_comment.dart';

final TextEditingController singleFeedCommentCtrl = TextEditingController();

class SPMSingleFeedPage extends GetView<NewFeedPageCtrl> {
  const SPMSingleFeedPage(this.index, {Key? key}) : super(key: key);

  @override
  NewFeedPageCtrl get controller => Get.put(NewFeedPageCtrl());

  final int index;

  @override
  Widget build(BuildContext context) {
    RxList commentList = [].obs;
    commentList.value = controller.getData['data'][index]['comment'];

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: Get.width * 0.8,
          child: Text(
            "Post of Post of ${controller.getData['data'][index]['name']}",
            overflow: TextOverflow.fade,
          ),
        ),
      ),
      bottomNavigationBar: commentBox(index),
      body: SingleChildScrollView(
        child: Column(
          children: [
            postContent(context, index),
            Obx(
              () => ListView.builder(
                itemBuilder: (buildContext, index) {
                  return postComment(context, index);
                },
                itemCount: commentList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                // physics: const ScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget commentBox(index) {
    return Container(
      alignment: Alignment.topCenter,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(width: 4, color: Colors.black12))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SPMAvatarBox(
              diameter: 32,
              image: AssetImage('assets/images/spm_test_avatar.png')),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              controller: singleFeedCommentCtrl,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  isDense: true,
                  hintText: 'Write your comment....',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                // if (singleFeedCommentCtrl.text.isNotEmpty) {
                //   commentList.add({
                //     "user_name": "Nguyễn Đức Thiện",
                //     "user_avatar":
                //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT2_RbVnuIvAJqyqo-GNU1UTme6kgsVAMhNNALhakpCcpI3IQIohRKMfe4XhmBJA-VxE8&usqp=CAU",
                //     "create_at": DateTime.now().millisecondsSinceEpoch,
                //     "user_comment": singleFeedCommentCtrl.text,
                //   });
                // }
                // singleFeedCommentCtrl.clear();
              },
              icon: const Icon(
                Icons.send,
                size: 30,
                color: Colors.blueAccent,
              ))
        ],
      ),
    );
  }

  Widget postContent(BuildContext context, index) {
    RxInt likes = 0.obs;
    likes.value = controller.getData['data'][index]['like'];
    RxInt commentCount = 0.obs;
    commentCount.value = controller.getData['data'][index]['comment'].length;
    RxBool isLiked = false.obs;
    isLiked.value = controller.getData['data'][index]['isLike'];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${controller.getData['data'][index]['avatar']}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(color: Colors.green, spreadRadius: 1.5)
                            ],
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${controller.getData['data'][index]['id']}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const SPMFriendProfilePage()));
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          '${controller.getData['data'][index]['name']}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy, HH:mm')
                            .format(DateTime.fromMillisecondsSinceEpoch(
                                controller.getData['data'][index]['create_at'] *
                                    1000))
                            .toString(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Place: ${controller.getData['data'][index]['place']}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Time: ${DateFormat('dd/MM/yyyy, HH:mm').format(DateTime.fromMillisecondsSinceEpoch(controller.getData['data'][index]['time'] * 1000)).toString()}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Level: ${controller.getData['data'][index]['level']}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Partner needed: ${controller.getData['data'][index]['partner needed']}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SPMButton(
                            width: 130,
                            color: SPMColors.primaryColor,
                            borderColor: SPMColors.primaryColor,
                            onPress: () {
                              Get.dialog(AlertDialog(
                                title: const Text('Send request?'),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Send request to this game?',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  SPMButton(
                                    color: SPMColors.primaryColor,
                                    onPress: () {
                                      Get.back();
                                      Get.snackbar(
                                        'Success!',
                                        'Your request have been sent',
                                        backgroundColor: Colors.orange.shade100,
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: const Duration(seconds: 2),
                                      );
                                    },
                                    borderColor: SPMColors.primaryColor,
                                    child: const Text('OK'),
                                  ),
                                  SPMButton(
                                    color: Colors.white,
                                    onPress: () {
                                      Get.back();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              ));
                            },
                            child: Text(
                              'Request game',
                              style: Get.textTheme.bodyText1,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${controller.getData['data'][index]['last_message']}',
                    ),
                  ),
                ],
              ),
              PhotoBuilder(controller.getData['data'][index]['photos']),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 42,
                child: Row(
                  children: [
                    Expanded(child: Obx(() {
                      return RawMaterialButton(
                        onPressed: () {
                          if (isLiked.value) {
                            likes.value--;
                          } else {
                            likes.value++;
                          }
                          isLiked.value = !isLiked.value;
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: isLiked.value
                                  ? Colors.blueAccent
                                  : Colors.black87,
                            ),
                            Text(
                              isLiked.value ? 'Liked' : 'Like',
                              style: TextStyle(
                                color: isLiked.value
                                    ? Colors.blueAccent
                                    : Colors.black87,
                              ),
                            )
                          ],
                        ),
                      );
                    })),
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {
                          Get.bottomSheet(
                            SPMComment(
                                // itemCount: commentList.length,
                                index: index),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10))),
                            backgroundColor: Colors.white,
                            isScrollControlled: true,
                            enableDrag: true,
                          );
                          // showBarModalBottomSheet(
                          //   context: Get.context!,
                          //   builder: (context) =>
                          // SizedBox(
                          //       // height: 700,
                          // child: SPMComment(
                          //     itemCount: controller
                          //         .getData['data'][index]['comment']
                          //         .length,
                          //     index: index)),
                          //   shape: const RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.vertical(
                          //           top: Radius.circular(10))),
                          //   bounce: true,
                          // );
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.comment),
                            Text(
                              'Comment',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        // alignment: Alignment.center,
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Icon(Icons.turn_right),
                            Text(
                              'Share',
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.thumb_up,
                      color: Colors.blueAccent,
                      size: 16,
                    ),
                    Obx(
                      () => Text(' $likes'),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   color: const Color(0xffe9e6e0),
        //   height: 5,
        // ),
      ],
    );
  }

  Widget postComment(context, commentIndex) {
    // return Obx(() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SPMAvatarBox(
            diameter: 32,
            image: NetworkImage(controller.getData['data'][index]['comment']
                [commentIndex]['user_avatar'])),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: Colors.black12,
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SPMFriendProfilePage()));
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          controller.getData['data'][index]['comment']
                              [commentIndex]['user_name'],
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.getData['data'][index]['comment']
                              [commentIndex]['user_comment'])
                        ],
                      ))
                    ],
                  ),
                ]),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Like'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Reply'),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(DateFormat('dd/MM/yyyy, HH:mm')
                      .format(DateTime.fromMillisecondsSinceEpoch(
                    controller.getData['data'][index]['comment'][commentIndex]
                            ['create_at'] *
                        1000,
                  )))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ],
    );
    // });
  }
}
