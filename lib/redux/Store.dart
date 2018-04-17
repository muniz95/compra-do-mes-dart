import 'dart:async';

import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:compra_do_mes/redux/app/AppReducer.dart';
import 'package:compra_do_mes/redux/product/ProductMiddleware.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  return new Store(
    appReducer,
    initialState: new AppState.initial(),
    distinct: true,
    middleware: [
      new ProductMiddleware(),
    ]
  );
}