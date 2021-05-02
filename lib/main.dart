import 'package:flutter/material.dart';
import 'package:verbose_user/CreateOrder.dart';
import 'package:verbose_user/Orders.dart';
import 'LoginPage.dart';
import 'Menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verbose User',
      theme: ThemeData.dark(),
      home: LoginPage(),
      //home: Menu(),
      //home: CreateOrder(),
      //home: Orders(),
    );
  }
}
