import 'package:flutter/material.dart';

class MonthTag extends StatefulWidget {
  @override
  _MonthTagState createState() => _MonthTagState();
}

class _MonthTagState extends State<MonthTag> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FlatButton(
            onPressed: () {},
            padding: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  'Month View',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
