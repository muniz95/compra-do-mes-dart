import 'package:compra_do_mes/constants/loading_status.dart';
import 'package:compra_do_mes/screens/product/product_form.screen.dart';
import 'package:flutter/material.dart';

import 'package:compra_do_mes/screens/common/error.screen.dart';
import 'package:compra_do_mes/screens/common/loading.screen.dart';
import 'package:compra_do_mes/screens/common/platform_adaptative_progress_indicator.screen.dart';

class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: LoadingView(
            status: LoadingStatus.success,
            loadingContent: PlatformAdaptiveProgressIndicator(),
            errorContent: ErrorScreen(onRetry: null),
            successContent: ProductFormScreen(),
          ),
        ),
      ],
    );
  }
}