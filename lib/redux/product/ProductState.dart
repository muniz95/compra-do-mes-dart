import 'package:compra_do_mes/models/Product.dart';
import 'package:meta/meta.dart';

@immutable
class ProductState {
  ProductState({
    @required this.currentProduct,
    @required this.products,
  });

  final Product currentProduct;
  final List<Product> products;

  factory ProductState.initial() {
    return new ProductState(
      currentProduct: new Product(),
      products: <Product>[],
    );
  }

  ProductState copyWith({
    Product currentProduct,
    List<Product> products,
  }) {
    return new ProductState(
      currentProduct: currentProduct ?? this.currentProduct,
      products: products ?? this.products,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductState &&
              runtimeType == other.runtimeType &&
              currentProduct == other.currentProduct &&
              products == other.products;

  @override
  int get hashCode =>
      currentProduct.hashCode ^
      products.hashCode;
}