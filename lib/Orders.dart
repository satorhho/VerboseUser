import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Menu.dart';

class Orders extends StatelessWidget {

  List<dynamic> order_ids;
  List<dynamic> statuses;

  Orders(List<String> orderIds, List<String> statusList){
    this.order_ids = orderIds;
    this.statuses = statusList;

    print(order_ids);
    print(statuses);
  }

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
                margin: const EdgeInsets.only(left: 75),
                child: Text("Order ID"),
              ),
              Container(
                margin: const EdgeInsets.only(left: 145, right: 50),
                child: Text("Status"),
              ),
            ],
          ),

          Expanded(
            child: Row(
              children: [
                // FOR ORDER ID
                Expanded(
                  child: ListView.builder(
                      itemCount: this.order_ids.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          child: Center(child: Text('${this.order_ids[index]}')),
                        );
                      },
                  ),
                ),

                //FOR STATUS

                Expanded(
                  child: ListView.builder(
                    itemCount: this.statuses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        child: Center(child: Text('${this.statuses[index]}')),
                      );
                    },
                  ),
                ),

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