import 'package:compra_do_mes/models/Product.dart';

class InitAction {}

class InitCompleteAction {
  InitCompleteAction(
    this.products,
    this.selectedProduct,
  );

  final List<Product> products;
  final Product selectedProduct;
}

class ChangeCurrentProductAction {
  ChangeCurrentProductAction(this.selectedProduct);
  final Product selectedProduct;
}