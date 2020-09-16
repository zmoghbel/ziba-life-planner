import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _events = {};
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/img/background.png'),
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  events: _events,
                  calendarController: _controller,
                  onDaySelected: (date, event) {
                    print(
                      date.toIso8601String(),
                    );
                  },
                  headerStyle: HeaderStyle(
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: CalendarStyle(
                    todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.green[600],
                    ),
                    todayColor: Color(0xFFFFFFFF),
                    selectedColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
