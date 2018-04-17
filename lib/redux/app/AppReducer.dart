import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:compra_do_mes/redux/product/ProductReducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    productState: productReducer(state.productState, action),
  );
}