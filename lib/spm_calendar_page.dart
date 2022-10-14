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
    DateTime(2022, 10, 10): [
      CleanCalendarEvent('Đá bóng',
          description: 'Team văn phòng tìm đối đá ra ...',
          location: 'Sân bóng Hoàng Gia',
          color: Colors.red,
          startTime: DateTime(2022, 9, 26, 13, 18),
          endTime: DateTime(2022, 10, 10, 15, 18)),
      CleanCalendarEvent("Tennis",
          description: 'Bạn mình bùng kèo nên cần tìm...',
          location: 'Nhà thi đấu Hoàng Mai',
          color: Colors.green,
          startTime: DateTime(2022, 10, 10, 16, 0),
          endTime: DateTime(2022, 10, 10, 20, 0)),
    ],
    DateTime(2022, 10, 15): [
      CleanCalendarEvent('Runer',
          description: 'Cần giảm cân mà thiếu động lực...',
          location: 'Công viên nghĩa đô',
          color: Colors.red,
          startTime: DateTime(2022, 10, 15, 05, 00),
          endTime: DateTime(2022, 10, 15, 07, 00)),
      CleanCalendarEvent("Tennis",
          description: 'Chuẩn bị thi đấu giải trẻ ...',
          location: 'Nhà thi đấu Hoàng Mai',
          color: Colors.green,
          startTime: DateTime(2022, 10, 15, 16, 0),
          endTime: DateTime(2022, 10, 15, 20, 0)),
    ],
    DateTime(2022, 10, 16): [
      CleanCalendarEvent('Bóng bàn',
          description: 'Tìm bạn tập luyện cho giải đấu ...',
          location: 'Nhà thi đấu Hà Đông',
          color: Colors.red,
          startTime: DateTime(2022, 10, 16, 08, 00),
          endTime: DateTime(2022, 10, 16, 12, 00)),
    ],
    DateTime(2022, 10, 18): [
      CleanCalendarEvent('Đá bóng',
          description: 'Team văn phòng tìm đối đá ra ...',
          location: 'Sân bóng Hoàng Gia',
          color: Colors.red,
          startTime: DateTime(2022, 10, 18, 13, 18),
          endTime: DateTime(2022, 10, 18, 15, 18)),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            color: Colors.black54,
          ),
          bottomBarTextStyle: const TextStyle(color: Colors.white),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: const ['Mon', 'Tue', 'Wed', 'Thu ', 'Fri', 'Sat', 'Sun'],
        ),
      ),
    );
  }
}
