import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/spm_create_page/spm_create_game.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_text_style.dart';

class SPMHeader extends GetView<CreateGameCtrl> {
  const SPMHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => Row(
                children: [
                  PopupMenuButton<Menu>(
                      icon: const Icon(
                        Icons.menu,
                        color: SPMColors.primaryColor,
                        size: 30,
                      ),
                      onSelected: (Menu item) {
                        controller.selectedMenu.value = item.name;
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Menu>>[
                            const PopupMenuItem<Menu>(
                              value: Menu.Soccer,
                              child: Text('Soccer'),
                            ),
                            const PopupMenuItem<Menu>(
                              value: Menu.Hiking,
                              child: Text('Hiking'),
                            ),
                            const PopupMenuItem<Menu>(
                              value: Menu.Volleyball,
                              child: Text('Volleyball'),
                            ),
                            const PopupMenuItem<Menu>(
                              value: Menu.Basketball,
                              child: Text('Basketball'),
                            ),
                            const PopupMenuItem<Menu>(
                              value: Menu.Tennis,
                              child: Text('Tennis'),
                            ),
                          ]),
                  Text(controller.selectedMenu.value,
                      style: textStyleHeading4.copyWith(
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
        GestureDetector(
          onTap: (() {
            debugPrint('Move to Profife Page');
          }),
          child: Container(
            height: 80,
            width: 100,
            decoration: const BoxDecoration(
              color: SPMColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.zero,
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.zero,
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SPMAvatarBox(
                      diameter: 60.0,
                      image: AssetImage('assets/images/SPM_test_avatar.png'))
                ]),
          ),
        ),
      ],
    );
  }
}
