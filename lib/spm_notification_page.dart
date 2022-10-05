import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/function/spm_shimmer.dart';
import 'package:sport_mate/function/spm_shimmer_notification.dart';
import 'function/post_api.dart';
import 'common/spm_colors.dart';

class SPMNotificationPageCtrl extends GetxController {
  RxList list = ['a', 'b', 'c'].obs;
  RxList notificationData = [].obs;
  RxBool isLoading = true.obs;

  Future<void> callNotification() async {
    isLoading(true);
    final SPMGetNotification spmGetNotification = SPMGetNotification();
    var apiData = await spmGetNotification.getData();
    if (apiData != null) {
      notificationData.value = apiData;
    }
    isLoading(false);
  }

  @override
  void onInit() {
    callNotification();
    super.onInit();
  }
}

class SPMNotificationPage extends GetView {
  const SPMNotificationPage({Key? key}) : super(key: key);

  @override
  SPMNotificationPageCtrl get controller => Get.put(SPMNotificationPageCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey,
          elevation: 0,
          title: const Text(
            'Notifications',
            style: TextStyle(color: SPMColors.primaryColor),
          ),
          centerTitle: true,
          // leading: const Icon(Icons.arrow_back_ios_new),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
          ],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const SPMShimmerNotification();
          } else {
          return SlidableAutoCloseBehavior(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return buildNotificationItem(index);
              },
              itemCount: controller.notificationData.length,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          );}
        }));
  }

  Widget buildNotificationItem(index) {
    return Column(
      children: [
        Slidable(
          // key: const ValueKey(1),
          // groupTag: 1,
          endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const ScrollMotion(),
            // dismissible: DismissiblePane(onDismissed: () {
            //   // controller.list.removeAt(index);
            //   print(controller.list);
            // }),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  controller.notificationData.removeAt(index);
                  DismissiblePane(onDismissed: () {});
                },
                icon: Icons.delete,
                label: 'Delete',
                backgroundColor: SPMColors.primaryColor,
              )
            ],
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: Get.width,
                height: 66,
                decoration: BoxDecoration(
                  color: const Color(0xffEBEBEB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    SPMAvatarBox(
                      diameter: 52,
                      image: NetworkImage(
                          controller.notificationData[index]['uer_avatar']),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text:
                                  '${controller.notificationData[index]['user_name']} ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      '${controller.notificationData[index]['action']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal),
                                ),
                                const TextSpan(
                                  text: ' on your post.',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Text(
                  DateFormat('dd/MM/yyyy, HH:mm')
                      .format(DateTime.fromMillisecondsSinceEpoch(
                          controller.notificationData[index]['action_time'] *
                              1000))
                      .toString(),
                  style: const TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
