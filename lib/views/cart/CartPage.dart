import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:compra_do_mes/views/cart/CartProductItem.dart';
import 'package:compra_do_mes/views/cart/CartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, CartViewModel>(
      distinct: true,
      converter: (store) => CartViewModel.fromStore(store),
      builder: (_, viewModel) => CartPageContent(viewModel),
    );
  }
}

class CartPageContent extends StatelessWidget {
  CartPageContent(this.viewModel);

  final CartViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return
    new Scaffold(
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              itemBuilder: (_, int index) =>
                new CartProductItem(product: viewModel.products[index]),
              itemCount: viewModel.products.length,
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.add),
      ),
    );
  }

}