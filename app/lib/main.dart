import 'package:app/pages/test_page.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/sign_in.dart';
import 'package:app/pages/create_group.dart';
import 'package:app/pages/first_login.dart';
import 'package:app/routes/routes_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: null,
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SignInPage(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
