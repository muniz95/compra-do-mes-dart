import 'dart:async';

import 'package:compra_do_mes/redux/app/AppActions.dart';
import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:compra_do_mes/redux/product/ProductActions.dart';
import 'package:redux/redux.dart';

class ProductMiddleware extends MiddlewareClass<AppState> {
  ProductMiddleware();

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    if (action is InitCompleteAction ||
        action is AddProductAction) {
      await _addProduct(store, action, next);
    }

    if (action is SetCurrentProductAction) {
      await _setCurrentProduct(store, action, next);
    }

    if (action is RemoveProductAction) {
      await _removeProduct(store, action, next);
    }

    if (action is RemoveAllProductsAction) {
      await _removeAllProducts(store, action, next);
    }
  }

  Future<Null> _addProduct(
    Store<AppState> store, dynamic action, NextDispatcher next
  ) async {
    next(new AddProductAction(store.state.productState.currentProduct));
  }

  Future<Null> _setCurrentProduct(
    Store<AppState> store, dynamic action, NextDispatcher next
  ) async {
    next(new SetCurrentProductAction(action));
  }

  Future<Null> _removeProduct(
    Store<AppState> store, dynamic action, NextDispatcher next
  ) async {
    next(new RemoveProductAction(action));
  }

  Future<Null> _removeAllProducts(
    Store<AppState> store, dynamic action, NextDispatcher next
  ) async {
    next(new RemoveAllProductsAction());
  }

}