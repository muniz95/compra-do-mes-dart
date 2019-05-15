import 'package:compra_do_mes/components/cart_product_item.component.dart';
import 'package:compra_do_mes/services/product.service.dart';
import 'package:flutter/material.dart';
import 'package:compra_do_mes/models/product.model.dart';
import 'package:compra_do_mes/screens/product/product_form.screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: productService.client,
      child: CacheProvider(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Flexible(
                child: Query(
                  options: QueryOptions(document: fetchQuery(), pollInterval: 1),
                  builder: (QueryResult result, {VoidCallback refetch}) {
                    if (result.errors != null) {
                      return Text(result.errors.toString());
                    }
                    if (result.loading) {
                      return CircularProgressIndicator();
                    }

                    List<Product> products = Product.fromList(result.data["product"]);
                    return ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      itemBuilder: (_, int i) => CartProductItemComponent(product: products[i]),
                      itemCount: products.length,
                    );
                  },
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
        ),
      ),
    );
  }
}
