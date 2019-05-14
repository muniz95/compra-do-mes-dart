import 'package:compra_do_mes/models/product.model.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  BehaviorSubject<List<Product>> _products = BehaviorSubject<List<Product>>();
  Stream<List<Product>> get products => _products.stream;

  init() {
    List<Product> products = [
      Product(name: "Arroz", price: 5.89, quantity: 2),
    ];
    _products.add(products);
  }

  void dispose() {
    _products.close();
  }
}