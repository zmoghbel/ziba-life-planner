import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;

  @override
  void initState() {
    // TODO implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
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
    );
  }
}
