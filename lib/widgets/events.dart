import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/add-event');
            },
            icon: Icon(
              Icons.add_box_sharp,
            ),
            label: Text('Add a new event'),
          ),
        ],
      ),
    );
  }
}
