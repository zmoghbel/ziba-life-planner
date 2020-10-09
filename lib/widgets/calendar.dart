import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key key,
    @required Map<DateTime, List> events,
    @required CalendarController calendarController,
  })  : _events = events,
        _calendarController = calendarController,
        super(key: key);

  final Map<DateTime, List> _events;
  final CalendarController _calendarController;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
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
    );
  }
}

class CurrentDateBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            formattedDate.toString(),
          ),
        ),
      ),
    );
  }
}
