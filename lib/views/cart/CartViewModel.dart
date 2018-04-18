import 'package:compra_do_mes/constants/LoadingStatus.dart';
import 'package:compra_do_mes/models/Product.dart';
import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class CartViewModel {
  CartViewModel({
    @required this.status,
    @required this.products,
  });

  final LoadingStatus status;
  final List<Product> products;

  static CartViewModel fromStore(Store<AppState> store) {
    return new CartViewModel(
      status: store.state.productState.loadingStatus,
      products: store.state.productState.products,
    );
  }
}