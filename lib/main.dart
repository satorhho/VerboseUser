import 'package:flutter/material.dart';
import 'package:verbose_user/CreateOrder.dart';
import 'package:verbose_user/Orders.dart';
import 'LoginPage.dart';
import 'Menu.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verbose User',
      theme: ThemeData.dark(),
      home: LoginPage(),
      // home: FutureBuilder(
      //   future: _fbApp,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       print("You have an error! ${snapshot.error.toString()}");
      //       return Text("Something went wrong!");
      //     }
      //     else if (snapshot.hasData) {
      //       return LoginPage();
      //     }
      //     else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
      //home: Menu(),
      //home: CreateOrder(),
      //home: Orders(),
    );
  }
}
