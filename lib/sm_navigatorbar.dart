import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_mate/spm_create_page/spm_create_game.dart';
import 'package:sport_mate/spm_home_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';
import 'package:sport_mate/spm_profile_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
                builder: (context) =>
                    const CupertinoPageScaffold(child: SPMHomePage()));
          case 1:
            return CupertinoTabView(
                builder: (context) =>
                    CupertinoPageScaffold(child: SPMCreateGame()));
          case 2:
            return CupertinoTabView(
                builder: (context) =>
                    const CupertinoPageScaffold(child: SPMNotificationPage()));
          case 3:
            return CupertinoTabView(
                builder: (context) =>
                    const CupertinoPageScaffold(child: SPMProfilePage()));

          default:
            return CupertinoTabView(
                builder: (context) =>
                    const CupertinoPageScaffold(child: SPMNewFeedPage()));
        }
      },
    );
  }
}

class SPMNotificationPage extends StatelessWidget {
  const SPMNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: const Center(
        child: Text('Hello from page 3'),
      ),
    ));
  }
}
