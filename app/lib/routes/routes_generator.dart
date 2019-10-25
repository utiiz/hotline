import 'package:app/pages/create_group.dart';
import 'package:app/pages/first_login.dart';
import 'package:app/routes/transition.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/sign_in.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/sign_in':
        return Transition(page: SignInPage());
      case '/first_login':
        // if (args is String) {}
        return Transition(page: FirstLoginPage());
      case '/group':
        return Transition(page: CreateGroupPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
