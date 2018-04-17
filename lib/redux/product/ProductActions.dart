import 'package:compra_do_mes/models/Product.dart';

class AddProductAction {
  AddProductAction(this.product);
  final Product product;
}

class SetCurrentProductAction {
  SetCurrentProductAction(this.product);
  final Product product;
}

class RemoveProductAction {
  RemoveProductAction(this.product);
  final Product product;
}

class RemoveAllProductsAction {
  RemoveAllProductsAction();
}
