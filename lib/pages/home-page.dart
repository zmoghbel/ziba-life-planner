import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziba_life_planner/widgets/events.dart';
import 'package:ziba_life_planner/widgets/tab-buttons.dart';
import 'package:ziba_life_planner/widgets/notes.dart';
import 'package:ziba_life_planner/widgets/tasks.dart';
import 'package:ziba_life_planner/widgets/tags/month-tag.dart';
import 'package:ziba_life_planner/widgets/tags/week-tag.dart';
import 'package:ziba_life_planner/widgets/tags/day-tag.dart';
import 'package:ziba_life_planner/widgets/tags/two-week-tag.dart';
import 'package:ziba_life_planner/widgets/calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events;
  bool viewCalendar = true;

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

  showCalendar() {
    viewCalendar = true;
  }

  hideCalendar() {
    viewCalendar = false;
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
                        (viewCalendar)
                            ? Calendar(
                                events: _events,
                                calendarController: _calendarController)
                            : CurrentDateBox(),
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
                        Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    hideCalendar();
                                  });
                                },
                                padding: EdgeInsets.all(0),
                                child: DayTag(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    showCalendar();
                                    _calendarController
                                        .setCalendarFormat(CalendarFormat.week);
                                  });
                                },
                                padding: EdgeInsets.all(0),
                                child: WeekTag(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    showCalendar();
                                    _calendarController.setCalendarFormat(
                                        CalendarFormat.month);
                                  });
                                },
                                padding: EdgeInsets.all(0),
                                child: MonthTag(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    showCalendar();
                                    _calendarController.setCalendarFormat(
                                        CalendarFormat.twoWeeks);
                                  });
                                },
                                padding: EdgeInsets.all(0),
                                child: TwoWeekTag(),
                              ),
                            )
                          ],
                        ),
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
