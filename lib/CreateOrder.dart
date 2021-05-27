import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verbose_user/Orders.dart';
import 'package:verbose_user/StockData.dart';
import 'package:verbose_user/StoreStock.dart';

final databaseReference = FirebaseDatabase.instance.reference();
class CreateOrder extends StatefulWidget {
  final String title;

  CreateOrder({Key key, this.title}) : super(key: key);

  @override
  _CreateOrder createState() => _CreateOrder();

}

class _CreateOrder extends State<CreateOrder> {
  String selected;
  List<String> items = ["Food", "Clothing", "Hardware"];
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
              "Choose a Product",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 150),
            child: DropdownButton(
              hint: Text("Select Item"),
              icon: Icon(Icons.arrow_downward),
              value: this.selected,
              onChanged: (newVal){
                setState((){
                  this.selected = newVal;
                });
              },
              items: this.items.map((valueItem){
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),

          // OutlineButton(
          //     onPressed: () {
          //       List<String> templist = [];
          //       List<dynamic> templistval = [];
          //       List<String> status_list = [];
          //       List<String> oid_list = [];
          //
          //       var future1 = this.databaseReference.child("Order").once().then((DataSnapshot snapshot){
          //         Map<dynamic, dynamic> value = snapshot.value;
          //         value.forEach((key, values) {
          //           templist.add(key);
          //           templistval.add(values);
          //         });
          //       });
          //
          //       future1.then((value) {
          //         templistval.forEach((element) {
          //           oid_list.add(element["order_id"]);
          //           status_list.add(element["status"]);
          //         });
          //
          //         print(oid_list);
          //         print(status_list);
          //       });
          //
          //   },
          // ),


          Expanded(
            child: Container(
              width: 150.0,
              height: 50.0,
              margin: const EdgeInsets.only(top: 250, bottom: 100),
              child: OutlineButton(
                child: Text("Checkout"),
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
                    // print(templist);
                    this.createData(templist.length+1);
                    this.readData();

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




                  // this.databaseReference.child("Order/order").set({
                  //   "stock_id" : "${id}",
                  //   "name" : "${name}",
                  //   "description" : "${desc}"
                  // });
                  //
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Orders()),
                  // );


                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void createData(int counter){
    String hold_stockid;
    if (this.selected == "Food")
      hold_stockid = "SID1";
    else if (this.selected == "Clothing")
      hold_stockid = "SID2";
    else
      hold_stockid = "SID3";

    this.databaseReference.child("Order/order$counter").set({
      "order_id" : "OID$counter",
      "status" : "Pending",
      "stock_id" : hold_stockid,
    });
  }
  void createDataTest(String id){
    this.databaseReference.child("Stock").set({
      "stock_id" : "$id",

    });
  }
  void deleteData(String reference){
    this.databaseReference.child("Stock/stock1").once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> value = snapshot.value;
      value.forEach((key, values) {
        if(values == "name"){
          this.items.add(values);
        }
      });
    });
  }
  void readData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
  void updateData(String child, String key, String value){
    this.databaseReference.child(child).update({
      "${key}" : "${value}"
    });
  }
}