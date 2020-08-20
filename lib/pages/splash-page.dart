import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'home-page.dart';
/* @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 500),
      () => Navigator.pushNamed(
        context,
        '${HomePage.PATH}/2/room/0',
        arguments: {'color': Colors.lightBlue, 'key': 'somekey'},
      ),
    );*/

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 4000), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> HomePage())));
    return Scaffold(
      body: Container(
          child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/img/splash.png'),
              ),
            ),
          ),
          Container(
            width: 250,
            height: 300,
            child: Center(
              child: Shimmer.fromColors(
                baseColor: Colors.blueGrey[900],
                highlightColor: Colors.yellow,
                child: Column(
                  children: [
                    Text(
                      'Ziba',
                      style: TextStyle(
                          fontSize: 70,
                          fontFamily: 'Pacifico',
                          shadows: <Shadow>[
                            Shadow(
                              blurRadius: 10,
                              color: Colors.grey,
                              offset: Offset.fromDirection(120, 12),
                            ),
                          ]),
                    ),
                    Text(
                      'Life-Planner',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Pacifico',
                          shadows: <Shadow>[
                            Shadow(
                              blurRadius: 10,
                              color: Colors.grey,
                              offset: Offset.fromDirection(120, 12),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
