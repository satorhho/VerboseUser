import 'StockData.dart';

class StoreStock {
  List<StockData> stock_list;

  StoreStock({this.stock_list});

  factory StoreStock.fromJSON(Map<dynamic, dynamic> json){
    return StoreStock(
        stock_list: parse_stocks(json)
    );
  }

  static List<StockData> parse_stocks(stockJSON){
    var sList = stockJSON["browseStocks"] as List;
    List<StockData> stockList = sList.map((e) => StockData.fromJson(e)).toList();
    return stockList;
  }

}