import 'package:compra_do_mes/bloc/product_form_screen.bloc.dart';
import 'package:compra_do_mes/services/product.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:compra_do_mes/models/product.model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductFormScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ProductFormScreenState();
}

class ProductFormScreenState extends State<ProductFormScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ProductFormScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProductFormScreenBloc();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RaisedButton saveBtn = RaisedButton(
      onPressed: _submit,
      child: Text("Salvar"),
      color: Theme.of(context).primaryColor,
    );
    Column loginForm = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: _bloc.setName,
                  validator: _bloc.validateProductName,
                  decoration: InputDecoration(labelText: "Produto"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: _bloc.setPrice,
                  decoration: InputDecoration(labelText: "Preço"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: _bloc.setQuantity,
                  decoration: InputDecoration(labelText: "Quantidade"),
                ),
              ),
            ],
          ),
        ),
        saveBtn,
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );

    return Scaffold(
      appBar: AppBar(),
      key: scaffoldKey,
      body: Container(
        child: Center(
          child: loginForm,
        ),
      ),
    );
  }

  void _submit() async {
    final form = formKey.currentState;
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (form.validate()) {
      form.save();
      // Product product = Product(name: _name, price: _price, quantity: _quantity);
      Product product = _bloc.getProduct();
      QueryResult result = await productService.client.value.mutate(
        MutationOptions(
          document: addProductMutation(product),
        ),
      );
      if (result.errors != null && result.errors.length > 0) {
        result.errors.forEach((GraphQLError error) => _showSnackBar(error.message));
      } else {
        form.reset();
        _showSnackBar('Produto salvo com sucesso!');
        Future.delayed(Duration(seconds: 3), Navigator.of(context).pop);
      }
    }
  }
  
  void _showSnackBar(String text) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(text)));
  }
}