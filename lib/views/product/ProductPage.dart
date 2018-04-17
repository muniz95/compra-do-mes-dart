import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:compra_do_mes/views/product/ProductForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:compra_do_mes/views/common/ErrorView.dart';
import 'package:compra_do_mes/views/common/LoadingView.dart';
import 'package:compra_do_mes/views/common/PlatformAdaptativeProgressIndicator.dart';
import 'ProductFormViewModel.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ProductFormViewModel>(
      distinct: true,
      converter: (store) => ProductFormViewModel.fromStore(store),
      builder: (_, viewModel) => new ProductPageContent(viewModel),
    );
  }
}

class ProductPageContent extends StatelessWidget {
  ProductPageContent(this.viewModel);
  final ProductFormViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new LoadingView(
            status: viewModel.status,
            loadingContent: new PlatformAdaptiveProgressIndicator(),
            errorContent: new ErrorView(onRetry: null),
            successContent: new ProductForm(),
          ),
        ),
      ],
    );
  }
}