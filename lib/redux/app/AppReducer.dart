import 'package:compra_do_mes/redux/app/AppState.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    productState: state.productState
  );
}