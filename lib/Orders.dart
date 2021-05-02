import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Menu.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 50),
            alignment: Alignment.center,
            child:  Text(
              "Orders",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text("Order ID"),
              ),
              Container(
                margin: const EdgeInsets.only(left: 175, right: 50),
                child: Text("Status"),
              ),
            ],
          ),

          Expanded(
            child: Row(
              children: [
                // FOR ORDER ID
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    children: [
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),

                    ],
                  ),
                ),

                //FOR STATUS

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 20, left: 60),
                    children: [
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),
                      Text("Hello, World!"),

                    ],
                  ),
                )

              ],
            )
          ),

          Container(
            width: 100.0,
            height: 50.0,
            margin: const EdgeInsets.only(bottom: 20),
            child: OutlineButton(
              child: Text("Menu"),
              highlightColor: Colors.white38,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}