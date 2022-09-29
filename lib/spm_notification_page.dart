import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'common/spm_colors.dart';

class SPMNotificationPageCtrl extends GetxController {
  RxList list = ['a', 'b', 'c'].obs;
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
          leading: const Icon(Icons.arrow_back_ios_new),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
          ],
        ),
        body: Obx(
          () => SlidableAutoCloseBehavior(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return buildNotificationItem(index);
              },
              itemCount: controller.list.length,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            ),
          ),
        ));
  }

  Widget buildNotificationItem(index) {
    return Column(
      children: [
        Slidable(
          // key: const ValueKey(1),
          // groupTag: 1,
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            // dismissible: DismissiblePane(onDismissed: () {
            //   // controller.list.removeAt(index);
            //   print(controller.list);
            // }),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  controller.list.removeAt(index);
                  DismissiblePane(onDismissed: () {});
                },
                icon: Icons.delete,
                label: 'Delete',
                backgroundColor: SPMColors.primaryColor,
              )
            ],
          ),
          child: Container(
            width: Get.width * 0.8,
            height: 66,
            decoration: BoxDecoration(
              color: const Color(0xffEBEBEB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('${controller.list[index]}')),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
