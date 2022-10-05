// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:sport_mate/common/spm_button.dart';
// import 'package:sport_mate/common/spm_colors.dart';
// import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:get/get.dart';

// class SPMCalendarPage extends GetView {
//   const SPMCalendarPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         title: const Text(
//           'Calendar',
//           style: TextStyle(fontSize: 25),
//         ),
//         elevation: 0.0,
//         centerTitle: false,
//       ),
//       body: Column(
//         children: <Widget>[
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: CalendarWidget(),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               width: 320,
//               height: 1,
//               color: Colors.black38,
//             ),
//           ),
//           Container(
//             color: Colors.amber,
//             child: const Text('Container'),
//           ),
//           SPMButton(
//               width: 130,
//               color: SPMColors.primaryColor,
//               borderColor: SPMColors.primaryColor,
//               onPress: () {
//                 Get.dialog(AlertDialog(
//                   title: const Text('Send request?'),
//                   content: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Send request to this game?',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   actionsAlignment: MainAxisAlignment.center,
//                   actions: [
//                     SPMButton(
//                       color: SPMColors.primaryColor,
//                       onPress: () {
//                         Get.back();
//                         Get.snackbar(
//                           'Success!',
//                           'Your request have been sent',
//                           backgroundColor: Colors.orange.shade100,
//                           snackPosition: SnackPosition.BOTTOM,
//                           duration: const Duration(seconds: 2),
//                         );
//                       },
//                       borderColor: SPMColors.primaryColor,
//                       child: const Text('OK'),
//                     ),
//                     SPMButton(
//                       color: Colors.white,
//                       onPress: () {
//                         Get.back();
//                       },
//                       child: const Text('Cancel'),
//                     ),
//                   ],
//                 ));
//               },
//               child: Text(
//                 'Request game',
//                 style: Get.textTheme.bodyText1,
//               ))
//         ],
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 50),
//         child: FloatingActionButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   CupertinoPageRoute(
//                       builder: (context) => const SPMCreateGameDetail()));
//             },
//             backgroundColor: SPMColors.primaryColor,
//             child: const Icon(Icons.create)),
//       ),
//     );
//   }
// }

// class CalendarWidget extends StatefulWidget {
//   const CalendarWidget({Key? key}) : super(key: key);

//   @override
//   State<CalendarWidget> createState() => _CalendarWidgetState();
// }

// class _CalendarWidgetState extends State<CalendarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SfCalendar(
//       view: CalendarView.month,
//       initialSelectedDate: DateTime.now(),
//       cellBorderColor: Colors.transparent,
//       todayHighlightColor: SPMColors.secondaryColor,
//       onTap: (CalendarTapDetails details) {
//         Get.dialog(AlertDialog(
//           title: const Text('Send request?'),
//           content: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text(
//                 'Send request to this game?',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//           actionsAlignment: MainAxisAlignment.center,
//           actions: [
//             SPMButton(
//               color: SPMColors.primaryColor,
//               onPress: () {
//                 Get.back();
//                 Get.snackbar(
//                   'Success!',
//                   'Your request have been sent',
//                   backgroundColor: Colors.orange.shade100,
//                   snackPosition: SnackPosition.BOTTOM,
//                   duration: const Duration(seconds: 2),
//                 );
//               },
//               borderColor: SPMColors.primaryColor,
//               child: const Text('OK'),
//             ),
//             SPMButton(
//               color: Colors.white,
//               onPress: () {
//                 Get.back();
//               },
//               child: const Text('Cancel'),
//             ),
//           ],
//         ));
//         debugPrint('It runs');
//       },
//       showDatePickerButton: true,
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';

class SPMCalendarPage extends StatefulWidget {
  const SPMCalendarPage({Key? key}) : super(key: key);

  @override
  State<SPMCalendarPage> createState() => _SPMCalendarPageState();
}

class _SPMCalendarPageState extends State<SPMCalendarPage> {
  DateTime? selectedDay;
  late List<CleanCalendarEvent> selectedEvent;

  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent("ABC",
          description: 'ABC Detail kajsdkajskjnckajsndckajn',
          color: Colors.red,
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0)),
      CleanCalendarEvent("Event B",
          description: 'Event B detaiklllasjdbcasjdca j',
          color: Colors.orange,
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0)),
      CleanCalendarEvent("Nguyen Hai Yen Birthday",
          description: 'Nguyen Hai Yen Birthday party join',
          color: Colors.green,
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0)),
    ],
  };
  void _handleDate(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    debugPrint('$selectedDay');
  }

  @override
  void initState() {
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const SPMCreateGameDetail()));
            },
            backgroundColor: SPMColors.primaryColor,
            child: const Icon(Icons.create)),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Calendar',
          style: TextStyle(fontSize: 25),
        ),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: SafeArea(
          child: Calendar(
        startOnMonday: true,
        selectedColor: SPMColors.secondaryColor,
        todayColor: SPMColors.primaryColor,
        eventColor: Colors.amber,
        eventDoneColor: Colors.pink,
        bottomBarColor: Colors.blue,
        onRangeSelected: (range) {
          debugPrint('selected dat ${range.from}, ${range.to}');
        },
        onDateSelected: (date) {
          return _handleDate(date);
        },
        events: events,
        isExpanded: true,
        dayOfWeekStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black12,
        ),
        bottomBarTextStyle: const TextStyle(color: Colors.white),
        hideBottomBar: false,
        hideArrows: false,
        weekDays: const ['Mon', 'Tue', 'Wed', 'Thu ', 'Fri', 'Sat', 'Sun'],
      )),
    );
  }
}
