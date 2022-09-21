import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/spm_create_game.dart';
import 'package:sport_mate/spm_home_page.dart';
import 'common/spm_colors.dart';

class MainHomePageCtrl extends GetxController {
  final RxInt _selectedIndex = 0.obs;
}

class MainHomePage extends GetView<MainHomePageCtrl> {
  final Widget _spmHomePage = const SPMHomePage();

  final Widget _spmHomePage1 = const SPMCreateGame();
  final Widget _myHomePage = const SPMHomePage();

  const MainHomePage({Key? key}) : super(key: key);
  @override
  MainHomePageCtrl get controller =>
      Get.put<MainHomePageCtrl>(MainHomePageCtrl());

  void _onItemTapped(int index) {
    controller._selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => getBody()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: controller._selectedIndex.value,
        selectedItemColor: SPMColors.primaryColor,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget getBody() {
    if (controller._selectedIndex.value == 0) {
      return _spmHomePage;
    } else if (controller._selectedIndex.value == 1) {
      return _spmHomePage1;
    } else if (controller._selectedIndex.value == 2) {
      return _spmHomePage1;
    } else {
      return _myHomePage;
    }
  }
}
