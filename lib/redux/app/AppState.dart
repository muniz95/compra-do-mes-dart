import 'package:compra_do_mes/redux/product/ProductState.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  AppState({
    @required this.productState,
  });

  final ProductState productState;

  factory AppState.initial() {
    return new AppState(
      productState: new ProductState.initial(),
    );
  }

  AppState copyWith({
    ProductState productState,
  }) {
    return new AppState(
      productState: productState ?? this.productState,
    );
  }

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is AppState &&
        runtimeType == other.runtimeType &&
        productState == other.productState;

  @override
  int get hashCode => 
    this.productState.hashCode;
}