class Product {
  Product({
    this.name,
    this.price,
    this.quantity
  });

  String name;
  double price;
  int quantity;

  Product.map(dynamic obj) {
    this.name = obj["name"];
    this.price = obj["price"];
    this.quantity = obj["quantity"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map["name"] = name;
    map["price"] = price;
    map["quantity"] = quantity;

    return map;
  }
}