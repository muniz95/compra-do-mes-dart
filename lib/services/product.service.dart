import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductService {
  static HttpLink httpLink = HttpLink(
    uri: 'https://cdm-api.herokuapp.com/v1alpha1/graphql',
  );
  static AuthLink authLink = AuthLink();
  static Link link = httpLink as Link;
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );
}

String toggleIsCompletedMutation(result, index) {
  return (
    """mutation ToggleProduct{
        update_product(where: {
          id: {_eq: ${result.data["todo"][index]["id"]}}},
          _set: {isCompleted: ${!result.data["todo"][index]["isCompleted"]}}) {
            returning {isCompleted } }
            }""");
}

String deleteProductMutation(result, index) {
  return ("""mutation DeleteProduct{       
              delete_product(where: {id: {_eq: ${result.data["todo"][index]["id"]}}}) {
                returning {id} }
                }""");
}

String addProductMutation(product) {
  return ("""
    mutation AddProduct{
      insert_product(
        objects: {
          name: "${product.name}",
          price: "${product.price}",
          quantity: ${product.quantity}
        }
      )
      {
        returning {id}
      }
    }
  """);
}

String fetchQuery() {
  return ("""query ProductGet{
              product {
                id
                name
                price
                quantity
              }} """);
}

ProductService productService = ProductService();