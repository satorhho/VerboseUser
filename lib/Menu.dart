import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CreateOrder.dart';
import 'Orders.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child:  Text(
              "123456789",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 150),
            alignment: Alignment.center,
            child:  Text(
              "User ID",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          Container(
            width: 200.0,
            height: 100.0,
            margin: const EdgeInsets.only(bottom: 80),
            child: OutlineButton(
              child: Text("Orders"),
              highlightColor: Colors.white38,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orders()),
                );
              },
            ),
          ),

          Container(
            width: 200.0,
            height: 100.0,
            child: OutlineButton(
              child: Text("Create Order"),
              highlightColor: Colors.white38,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateOrder()),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

}