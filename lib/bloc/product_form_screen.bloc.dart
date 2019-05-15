import 'package:compra_do_mes/models/product.model.dart';
import 'package:rxdart/rxdart.dart';

class ProductFormScreenBloc {
  BehaviorSubject<String> _name = BehaviorSubject<String>();
  BehaviorSubject<double> _price = BehaviorSubject<double>();
  BehaviorSubject<int> _quantity = BehaviorSubject<int>();

  String validateProductName(String val) {
    return val.length < 1
      ? "O nome do produto é obrigatório"
      : null;
  }

  void setName(String val) {
    _name.add(val);
  }

  void setPrice(String val) {
    _price.add(double.tryParse(val));
  }

  void setQuantity(String val) {
    _quantity.add(int.tryParse(val));
  }

  Product getProduct() {
    return Product(
      name: _name.value,
      price: _price.value,
      quantity: _quantity.value,
    );
  }

  void dispose() {
    _name.close();
    _price.close();
    _quantity.close();
  }
}