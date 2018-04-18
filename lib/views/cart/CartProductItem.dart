import 'package:compra_do_mes/models/Product.dart';
import 'package:flutter/material.dart';

class CartProductItem extends StatelessWidget {
  CartProductItem({this.product});
  
  final Product product;
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  product.name,
                  style: Theme.of(context).textTheme.subhead
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(product.price.toString()),
                ),
              ],
            ),
          ),  
        ],
      ),
    );
  }
}