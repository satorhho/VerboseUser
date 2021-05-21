import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verbose_user/Orders.dart';

final databaseReference = FirebaseDatabase.instance.reference();
class CreateOrder extends StatefulWidget {
  final String title;

  CreateOrder({Key key, this.title}) : super(key: key);

  @override
  _CreateOrder createState() => _CreateOrder();

}

class _CreateOrder extends State<CreateOrder> {
  String selected;
  List items = ["Food", "Clothing", "Others"];
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
          
          RaisedButton(
            child: Text("Create"),
            onPressed: (){
              print("Code reached here1");
              this.createData("SID2", "clothing", "clothing description");
              print("Code reached here2");
            },
          ),
          
          RaisedButton(
            child: Text("Delete"),
            onPressed: (){
              this.deleteData("Stock");
            },
          ),
          
          RaisedButton(
            child: Text("Update"),
            onPressed: (){
              this.updateData("User", "user_name", "jay2borazon");
              },
          ),

          RaisedButton(
            child: Text("Read"),
            onPressed: (){
              this.readData();
            },
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

  void createData(String id, String name, String desc){
    this.databaseReference.child("Stock").set({
      "stock_id" : "${id}",
      "name" : "${name}",
      "description" : "${desc}"
    });
  }
  void deleteData(String reference){
    this.databaseReference.child(reference).remove();
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