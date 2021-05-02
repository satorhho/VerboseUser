import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Menu.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 10, left: 30, right: 30),
            child: Text(
              "Verbose Groceries",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontFamily: "Raleway",
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 30, bottom: 80, right: 30),
            child: Text(
              "User Application",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Raleway",
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.person),
                ),
                Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder()
                      ),
                    )
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.lock),
                ),
                Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder()
                      ),
                    )
                ),
              ],
            ),
          ),

          OutlineButton(
            child: Text("SUBMIT"),
            highlightColor: Colors.white38,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
              );
            },
          ),
        ],
      ),
    );
  }

}