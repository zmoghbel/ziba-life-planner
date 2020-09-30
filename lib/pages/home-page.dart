import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziba_life_planner/pages/events.dart';
import 'package:ziba_life_planner/pages/tab-buttons.dart';
import 'package:ziba_life_planner/pages/notes.dart';
import 'package:ziba_life_planner/pages/tasks.dart';
import 'month-tag.dart';
import 'week-tag.dart';
import 'day-tag.dart';
import 'tow-week-tag.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
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

  //Writed by zahra on 2020/09/28
  //Edited by Zeinab on 2020/09/30
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image(
              image: AssetImage('assets/img/homePage-background.png'),
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              //color: Colors.yellow,
              /*margin: EdgeInsets.only(
                left: 8.0,
                right: 40,
                top: 20.0,
                bottom: 22.0,
              ),*/
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        TableCalendar(
                          //availableCalendarFormats: CalendarFormat.day,
                          events: _events,
                          calendarController: _calendarController,
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
                        TabButtons(_pageController),
                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            children: <Widget>[
                              Tasks(),
                              Events(),
                              Notes(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DayTag(),
                        WeekTag(),
                        MonthTag(),
                        TowWeekTag(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
