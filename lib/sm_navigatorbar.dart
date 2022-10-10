import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/spm_calendar_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';
import 'package:sport_mate/spm_notification_page.dart';
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
        onTap: (value) {
          debugPrint('$value');

          // if (value == 0) {
          //   Navigator.pushAndRemoveUntil(
          //       context,
          //       CupertinoPageRoute(
          //         builder: (BuildContext context) => const BottomBarPage(),
          //       ),
          //       (route) => false);
          // } else if (value == 2) {
          //   Navigator.pushAndRemoveUntil(
          //       context,
          //       CupertinoPageRoute(
          //         builder: (BuildContext context) => const SPMCalendarPage(),
          //       ),
          //       (route) => false);
          // }
        },
        activeColor: SPMColors.primaryColor,
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
                    const CupertinoPageScaffold(child: SPMNewFeedPage()));
          case 1:
            return CupertinoTabView(
                builder: (context) =>
                    const CupertinoPageScaffold(child: SPMNotificationPage()));
          case 2:
            return CupertinoTabView(
                builder: (context) =>
                    const CupertinoPageScaffold(child: SPMCalendarPage()));
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
