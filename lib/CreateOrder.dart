import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verbose_user/Orders.dart';

class CreateOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child:  Text(
              "Choose a Product",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 150),
            width: 100.0,
            height: 50.0,
            child: DropdownButton(), // Update this later
          ),

          Container(
            width: 100.0,
            height: 50.0,
            margin: const EdgeInsets.only(top: 150),
            child: OutlineButton(
              child: Text("Checkout"),
              highlightColor: Colors.white38,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orders()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}