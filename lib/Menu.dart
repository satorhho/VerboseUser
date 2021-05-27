import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CreateOrder.dart';
import 'Orders.dart';

class Menu extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();

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
                List<String> templist = [];
                List<dynamic> templistval = [];
                List<String> status_list = [];
                List<String> oid_list = [];

                var future1 = this.databaseReference.child("Order").once().then((DataSnapshot snapshot){
                  Map<dynamic, dynamic> value = snapshot.value;
                  value.forEach((key, values) {
                    templist.add(key);
                    templistval.add(values);
                  });
                });

                future1.then((value) {
                  templistval.forEach((element) {
                    oid_list.add(element["order_id"]);
                    status_list.add(element["status"]);
                  });

                  // Navigation here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Orders(oid_list, status_list)),
                  );
                });
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