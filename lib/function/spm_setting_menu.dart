import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_button.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/spm_update_infor.dart';
import 'package:sport_mate/spm_welcome_page.dart';

enum MenuItems { updateProfile, logout }

class SPMSettingMenu extends GetView {
  const SPMSettingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItems>(
        padding: const EdgeInsets.all(0),
        icon: const Icon(Icons.settings),
        onSelected: (MenuItems item) {
          if (item.name == 'logout') {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text(
                        'Logout?',
                        style: TextStyle(fontSize: 22),
                      ),
                      content: const Text('Do you want to log out!'),
                      actions: [
                        SPMButton(
                          color: SPMColors.primaryColor,
                          borderColor: SPMColors.primaryColor,
                          child: const Text('OK'),
                          onPress: () {
                            Get.offAll(SPMWelcomePage());
                          },
                        ),
                        SPMButton(
                          color: Colors.grey.shade300,
                          borderColor: Colors.grey.shade300,
                          child: const Text('Cancel'),
                          onPress: () {
                            Get.back();
                          },
                        ),
                      ],
                    ));
          } else if (item.name == 'updateProfile') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SPMUpdateInfor()));
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItems>>[
              PopupMenuItem(
                padding: const EdgeInsets.all(0),
                value: MenuItems.updateProfile,
                child: Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.edit_note,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Update Profile'),
                  ],
                ),
              ),
              PopupMenuItem(
                padding: const EdgeInsets.all(0),
                value: MenuItems.logout,
                child: Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.logout,
                      // color: Colors.green,
                      // size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Logout'),
                  ],
                ),
              ),
            ]);
  }
}
