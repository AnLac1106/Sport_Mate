import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/common/spm_button.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/function/photo_builder.dart';
import 'package:sport_mate/function/spm_comment.dart';
import 'package:sport_mate/function/spm_shimmer.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';
import 'package:sport_mate/spm_create_game_page.dart';
import 'package:sport_mate/spm_friend_profile_page.dart';
import 'function/post_api.dart';

class NewFeedPageCtrl extends GetxController {
  RxMap getData = {}.obs;
  RxBool isLoading = true.obs;

  // RxInt like = 0.obs;
  // RxBool isLiked = false.obs;

  Future<void> callAPI() async {
    isLoading(true);
    final PostAPI postAPI = PostAPI();
    var apiData = await postAPI.getData();
    if (apiData != null) {
      getData.value = apiData;
    }
    isLoading(false);
  }

  @override
  void onInit() {
    callAPI();
    super.onInit();
  }
}

class SPMNewFeedPage extends GetView<NewFeedPageCtrl> {
  const SPMNewFeedPage({Key? key}) : super(key: key);

  @override
  NewFeedPageCtrl get controller => Get.put(NewFeedPageCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
        [SliverAppBar(
            backgroundColor: Colors.white,
            snap: true,
            floating: true,
            title: appBarTest(),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return const SPMShimmer();
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return buildItem(context, index);
                    },
                    itemCount: controller.getData['data'].length,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, index) {
    RxInt likes = 0.obs;
    likes.value = controller.getData['data'][index]['like'];
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
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Time: ${DateFormat('dd/MM/yyyy, HH:mm').format(DateTime.fromMillisecondsSinceEpoch(controller.getData['data'][index]['time'] * 1000)).toString()}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Level: ${controller.getData['data'][index]['level']}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Partner needed: ${controller.getData['data'][index]['partner needed']}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
              PhotoBuilder(controller.getData['data'][index]['photos']),
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
                      () => Text(
                          // '  ${controller.getData['data'][index]['like']}',
                          // ' ${controller.like}'
                          ' $likes'),
                    ),
                    const Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: () {
                        showBarModalBottomSheet(
                          context: Get.context!,
                          builder: (context) => SizedBox(
                              height: 700,
                              child: SPMComment(
                                  itemCount: controller
                                      .getData['data'][index]['comment'].length,
                                  index: index)),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10))),
                          bounce: true,
                        );
                        // Get.bottomSheet(
                        //   Container(
                        //     height: 700,
                        //     child: const SPMComment(
                        //         userAvatar: 'https://vcdn1-dulich.vnecdn.net/2020/09/04/1-Meo-chup-anh-dep-khi-di-bien-9310-1599219010.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=j8THd4HE31ZHWTQhSZx5tQ',
                        //         userName: 'Thử Nghiệm',
                        //         createAt: 1664037858,
                        //         userComment: 'Testtttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt'
                        //     ),
                        //   ),
                        //   shape: const RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.vertical(
                        //           top: Radius.circular(10))),
                        //   backgroundColor: Colors.white,
                        //   barrierColor: Colors.blue.withOpacity(0.2),
                        //   isScrollControlled: true,
                        //   enableDrag: true,
                        //   isDismissible: false,
                        // );
                      },
                      child: Text(
                        '${controller.getData['data'][index]['comment'].length} comments',
                      ),
                    ),
                  ],
                ),
              ),
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
                          showBarModalBottomSheet(
                            context: Get.context!,
                            builder: (context) => SizedBox(
                                // height: 700,
                                child: SPMComment(
                                    itemCount: controller
                                        .getData['data'][index]['comment']
                                        .length,
                                    index: index)),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10))),
                            bounce: true,
                          );
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
            ],
          ),
        ),
        Container(
          color: const Color(0xffe9e6e0),
          height: 5,
        ),
      ],
    );
  }

  Widget appBarTest() {
    return Row(
      children: [
        const SizedBox(
          width: 0,
        ),
        Container(
          width: 40,
          height: 40,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/avatar1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffeff3f7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffeff3f7)),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(0),
                filled: true,
                fillColor: const Color(0xffeff3f7),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
          width: 40,
          height: 40,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: SPMColors.primaryColor //Color(0xffeff3f7),
              // boxShadow: [
              //   BoxShadow(color: boxShadowColor, spreadRadius: spreadRadius)
              // ],
              // image: DecorationImage(image: image, fit: BoxFit.cover),
              ),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ),
      ],
    );
  }
}
