import 'package:verbose_user/StockData.dart';
import 'package:verbose_user/StoreStock.dart';

class MakeCallStock {
  List<StockData> listItems = [];

  Future<List<StockData>> firebaseCalls(DatabaseReference databaseReference) async {
    StoreStock stockList;
      DataSnapshot dataSnapshot = await databaseReference.once();
      Map<dynamic, dynamic> jsonResponse = dataSnapshot.value[0]["content"];
      stockList = new StoreStock.fromJSON(jsonResponse);
      listItems.addAll(stocklist.stock_list);
    return listItems;
  }
}