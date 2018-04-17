import 'package:compra_do_mes/constants/LoadingStatus.dart';
import 'package:compra_do_mes/models/Product.dart';
import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:compra_do_mes/redux/product/ProductActions.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class ProductFormViewModel {
  ProductFormViewModel({
    @required this.status,
    @required this.product,
    @required this.addProduct,
  });
    
  final LoadingStatus status;
  final Product product;
  final Function addProduct;

  static ProductFormViewModel fromStore(Store<AppState> store) {
    return new ProductFormViewModel(
      status: store.state.productState.loadingStatus,
      product: new Product(),
      addProduct: (product) => store.dispatch(new AddProductAction(product)),
    );
  }
}