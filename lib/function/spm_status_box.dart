import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Menu { online, offline, away }

class SPMStatusBoxCtrl extends GetxController {
  RxString selectedItem = 'online'.obs;
}

class SPMStatusBox extends GetView {
   const SPMStatusBox({this.width = 85, this.height = 25, Key? key,}) : super(key: key);

  @override
  SPMStatusBoxCtrl get controller => Get.put(SPMStatusBoxCtrl());

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: const Color(0xffEBEBEB),
              borderRadius: BorderRadius.circular(20),
            ),
            child:Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 status(),
               Text(controller.selectedItem.value)
              ],
            ), ),
          ),
          SizedBox(
              width: width,
              height: height,
              child: PopupMenuButton<Menu>(
                padding: const EdgeInsets.all(0),
                  icon: Container(),
                  onSelected: (Menu item) {
                      controller.selectedItem.value = item.name;
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    const PopupMenuItem(
                      padding: EdgeInsets.all(0),
                      value: Menu.online,
                      child: ListTile(
                        leading: Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 18,
                        ),
                        title: Text('online'),
                      ),
                    ),
                    const PopupMenuItem(
                      padding: EdgeInsets.all(0),
                      value: Menu.offline,
                      child: ListTile(
                        leading: Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 18,
                        ),
                        title: Text('offline'),
                      ),
                    ),
                    const PopupMenuItem(
                      padding: EdgeInsets.all(0),
                      value: Menu.away,
                      child: ListTile(
                        leading: Icon(
                          Icons.watch_later,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        title: Text('away'),
                      ),
                    ),
                  ]),
              ),
        ]);

  }

  Widget status() {
    if (controller.selectedItem.value == 'online') {
      return const Icon(
        Icons.circle,
        color: Colors.green,
        size: 18,
      );
    } else if (controller.selectedItem.value == 'offline') {
      return const Icon(
        Icons.circle,
        color: Colors.red,
        size: 18,
      );
    } else {
      return const Icon(
        Icons.watch_later,
        color: Colors.yellow,
        size: 18,
      );
    }
  }
}
