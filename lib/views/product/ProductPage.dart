import 'package:compra_do_mes/constants/LoadingStatus.dart';
import 'package:compra_do_mes/views/product/ProductForm.dart';
import 'package:flutter/material.dart';

import 'package:compra_do_mes/views/common/ErrorView.dart';
import 'package:compra_do_mes/views/common/LoadingView.dart';
import 'package:compra_do_mes/views/common/PlatformAdaptativeProgressIndicator.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new LoadingView(
            status: LoadingStatus.success,
            loadingContent: new PlatformAdaptiveProgressIndicator(),
            errorContent: new ErrorView(onRetry: null),
            successContent: new ProductForm(),
          ),
        ),
      ],
    );
  }
}