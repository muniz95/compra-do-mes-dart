import 'package:compra_do_mes/constants/LoadingStatus.dart';
import 'package:compra_do_mes/models/Product.dart';
import 'package:meta/meta.dart';

@immutable
class ProductState {
  ProductState({
    @required this.loadingStatus,
    @required this.currentProduct,
    @required this.products,
  });

  final LoadingStatus loadingStatus;
  final Product currentProduct;
  final List<Product> products;

  factory ProductState.initial() {
    return new ProductState(
      loadingStatus: LoadingStatus.loading,
      currentProduct: new Product(),
      products: <Product>[],
    );
  }

  ProductState copyWith({
    LoadingStatus loadingStatus,
    Product currentProduct,
    List<Product> products,
  }) {
    return new ProductState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      currentProduct: currentProduct ?? this.currentProduct,
      products: products ?? this.products,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductState &&
              runtimeType == other.runtimeType &&
              loadingStatus== other.loadingStatus &&
              currentProduct == other.currentProduct &&
              products == other.products;

  @override
  int get hashCode =>
      loadingStatus.hashCode ^
      currentProduct.hashCode ^
      products.hashCode;
}