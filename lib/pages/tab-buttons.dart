import 'package:flutter/material.dart';

class TabButtons extends StatelessWidget {
  final PageController _pageController;

  TabButtons(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      RaisedButton(
        color: Colors.yellow[100],
        child: Text('Tasks'),
        onPressed: () => _pageController.jumpToPage(0),
      ),
      RaisedButton(
        color: Colors.yellow[100],
        child: Text('Events'),
        onPressed: () => _pageController.jumpToPage(1),
      ),
      RaisedButton(
        color: Colors.yellow[100],
        child: Text('Notes'),
        onPressed: () => _pageController.jumpToPage(2),
      ),
    ]);
  }
}
