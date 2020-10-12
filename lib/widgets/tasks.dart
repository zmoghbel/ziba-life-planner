import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("Task 1........."),
          leading: Icon(Icons.check_box),
          onTap: () {
            setState(
              () {
                print('Task 1 was tapped');
              },
            );
          },
        ),
        ListTile(
          title: Text("Task 2........."),
          leading: Icon(Icons.check_box),
          onTap: () {
            setState(
              () {
                print('Task 2 was tapped');
              },
            );
          },
        ),
        ListTile(
          title: Text("Task 3........."),
          leading: Icon(Icons.check_box),
          onTap: () {
            setState(
              () {
                print('Task 3 was tapped');
              },
            );
          },
        ),
        ListTile(
          title: Text("Task 4........."),
          leading: Icon(Icons.check_box),
          onTap: () {
            setState(
              () {
                print('Task 4 was tapped');
              },
            );
          },
        ),
        ListTile(
          title: Text("Task 5........."),
          leading: Icon(Icons.check_box),
          onTap: () {
            setState(
              () {
                print('Task 5 was tapped');
              },
            );
          },
        ),
      ],
    );
  }
}
