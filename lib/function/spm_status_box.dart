import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Menu { online, offline, away }

class SPMStatusBoxCtrl extends GetxController {
  RxString selectedItem = 'online'.obs;
}

class SPMStatusBox extends GetView {
   SPMStatusBox({ required this.select,
    Key? key,
  }) : super(key: key);

  String select;

  // @override
  // SPMStatusBoxCtrl get controller => Get.put(SPMStatusBoxCtrl());

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
          Container(
            width: 85,
            height: 25,
            decoration: BoxDecoration(
              color: const Color(0xffEBEBEB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Obx(() => status(),),
               Text(select)
              ],
            ),
          ),
          SizedBox(
              width: 85,
              height: 25,
              child: PopupMenuButton<Menu>(
                  icon: Container(),
                  onSelected: (Menu item) {
                      select = item.name;
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    const PopupMenuItem(
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
      );
    } else if (controller.selectedItem.value == 'offline') {
      return const Icon(
        Icons.circle,
        color: Colors.red,
      );
    } else {
      return const Icon(
        Icons.watch_later,
        color: Colors.yellow,
      );
    }
  }
}
