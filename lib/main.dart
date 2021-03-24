import 'package:ems_app/signup.dart';
import 'package:ems_app/workerHome.dart';
import 'package:ems_app/forgotPassword.dart';
import 'package:ems_app/managerHome.dart';
import 'package:flutter/material.dart';
import 'package:ems_app/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/signup": (BuildContext context) => SignupPage(),
        "/workerHome": (BuildContext context) => WorkerHomePage(),
        "/managerHome": (BuildContext context) => ManagerHomePage(),
        "/forgotPassword": (BuildContext context) => ForgotPasswordPage(),
      },
      home: LoginPage(),
    );
  }
}
