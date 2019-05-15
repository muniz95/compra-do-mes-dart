class Product {
  Product({
    this.name,
    this.price,
    this.quantity
  });

  String name;
  double price;
  int quantity;

  factory Product.map(Map<String, dynamic> obj) {
    if (obj == null) {
      return Product();
    }
    return Product(
      name: obj["name"],
      price: obj["price"],
      quantity: obj["quantity"],
    );
  }

  // A wrapper that allows the factory method
  // to be called inside lambda functions
  static Product fromMap(Map<String, dynamic> obj) => Product.map(obj);
  static List<Product> fromList(List<dynamic> obj) {
    if (obj == null) {
      return [];
    }
    return obj
      .cast<Map<String, dynamic>>()
      .map(Product.fromMap)
      .toList();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["name"] = name;
    map["price"] = price;
    map["quantity"] = quantity;

    return map;
  }
}