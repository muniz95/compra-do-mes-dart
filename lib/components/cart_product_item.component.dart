import 'package:compra_do_mes/models/product.model.dart';
import 'package:flutter/material.dart';

class CartProductItemComponent extends StatelessWidget {
  CartProductItemComponent({this.product});
  
  final Product product;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.subhead
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(product.price.toString()),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Text('Quantidade: ${product.quantity}')
            ],
          ),
        ],
      ),
    );
  }
}