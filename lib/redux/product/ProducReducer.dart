import 'package:compra_do_mes/models/Product.dart';
import 'package:compra_do_mes/redux/product/ProductActions.dart';
import 'package:compra_do_mes/redux/product/ProductState.dart';
import 'package:redux/redux.dart';

final distroReducer = combineReducers<ProductState>([
  new TypedReducer<ProductState, AddProductAction>(_addProduct),
  new TypedReducer<ProductState, SetCurrentProductAction>(_setCurrentProduct),
  new TypedReducer<ProductState, RemoveProductAction>(_removeProduct),
  new TypedReducer<ProductState, RemoveAllProductsAction>(_removeAllProducts),
]);

ProductState _addProduct(ProductState state, AddProductAction action) {
  List<Product> products = state.products;
  products.add(action.product);
  return state.copyWith(products: products);
}

ProductState _setCurrentProduct(ProductState state, SetCurrentProductAction action) {
  return state.copyWith(currentProduct: action.product);
}

ProductState _removeProduct(ProductState state, RemoveProductAction action) {
  List<Product> products = state.products;
  products.remove(action.product);
  return state.copyWith(products: products);
}

ProductState _removeAllProducts(ProductState state, RemoveAllProductsAction action) {
  return state.copyWith(products: <Product>[]);
}