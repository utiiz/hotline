import 'package:flutter/material.dart';

class Transition extends PageRouteBuilder {
  final Widget page;

  Transition({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: 1000),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            Animation exit = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animation, curve: Interval(0.0, 0.33)));
            Animation middle = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animation, curve: Interval(0.33, 0.67)));
            Animation enter = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animation, curve: Interval(0.67, 1.0)));
            return Stack(
              children: <Widget>[
                FadeTransition(
                  opacity: exit,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                FadeTransition(
                  opacity: middle,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                FadeTransition(
                  opacity: enter,
                  child: page,
                ),
              ],
            );
          },
        );
}
