class StockData {
  String stock_id;
  String name;
  String description;

  StockData({this.stock_id, this.name, this.description});

  factory StockData.fromJson(Map<dynamic, dynamic> parsedJson) {
    return StockData(stock_id: parsedJson["stock_id"], name: parsedJson["name"], description: parsedJson["description"]);
  }
}