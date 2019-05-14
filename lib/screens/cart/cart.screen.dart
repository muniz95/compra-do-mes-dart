import 'package:flutter/material.dart';
import 'package:compra_do_mes/bloc/cart.bloc.dart';
import 'package:compra_do_mes/models/product.model.dart';
import 'package:compra_do_mes/screens/cart/cart_product_item.screen.dart';
import 'package:compra_do_mes/screens/product/product_form.screen.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CartBloc()..init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: StreamBuilder<List<Product>>(
              stream: _bloc.products,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Product> products = snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemBuilder: (_, int i) => CartProductItem(product: products[i]),
                    itemCount: products.length,
                  );
                }
                return CircularProgressIndicator();
              }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ProductFormScreen()
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
