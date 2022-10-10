import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_text_style.dart';

class SPMHeader extends GetView<CreateGameCtrl> {
  const SPMHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String select = 'Select Sport';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Row(
                  children: [
                    PopupMenuButton(
                        icon: const Icon(
                          Icons.fact_check,
                          color: SPMColors.primaryColor,
                          size: 30,
                        ),
                        onSelected: (value) =>
                            controller.sportSelect.value = value.toString(),
                        itemBuilder: (BuildContext context) => [
                              const PopupMenuItem(
                                value: 'Soccer',
                                child: Text('Soccer'),
                              ),
                              const PopupMenuItem(
                                value: 'Hiking',
                                child: Text('Hiking'),
                              ),
                              const PopupMenuItem(
                                value: 'Volleyball',
                                child: Text('Volleyball'),
                              ),
                              const PopupMenuItem(
                                value: 'Basketball',
                                child: Text('Basketball'),
                              ),
                              const PopupMenuItem(
                                value: 'Tennis',
                                child: Text('Tennis'),
                              ),
                              const PopupMenuItem(
                                value: 'Other',
                                child: Text('Other'),
                              ),
                            ]),
                    Obx(
                      () => Text(controller.sportSelect.toString(),
                          style: textStyleHeading4.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ],
            )),
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
                      image: AssetImage('assets/images/spm_test_avatar.png'))
                ]),
          ),
        ),
      ],
    );
  }
}
