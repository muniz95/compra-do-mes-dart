import 'dart:ui';

import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'ProductFormViewModel.dart';

class ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ProductFormViewModel>(
      distinct: true,
      converter: (store) => ProductFormViewModel.fromStore(store),
      builder: (_, viewModel) => new ProductFormContent(viewModel: viewModel),
    );
  }
}

class ProductFormContent extends StatelessWidget {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  ProductFormContent({
    this.viewModel,
  });

  final ProductFormViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    var saveBtn = new RaisedButton(
      onPressed: () => _submit(context),
      child: new Text("Salvar"),
      color: Theme.of(context).primaryColor,
    );
    var loginForm = new Column(
      children: <Widget>[
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => viewModel.product.name = val,
                  validator: _validateProductName,
                  decoration: new InputDecoration(labelText: "Produto"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => viewModel.product.price = double.parse(val),
                  decoration: new InputDecoration(labelText: "Preço"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => viewModel.product.quantity = int.parse(val),
                  decoration: new InputDecoration(labelText: "Quantidade"),
                ),
              ),
            ],
          ),
        ),
        saveBtn,
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );

    return new Container(
      child: new Center(
        child: new ClipRect(
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
              child: loginForm,
              width: 300.0,
            ),
          ),
        ),
      ),
    );
  }

  String _validateProductName(val) {
    return val.length < 1
      ? "O nome do produto é obrigatório"
      : null;
  }

  void _submit(BuildContext context) {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      viewModel.addProduct(viewModel.product);
      form.reset();
      _showSnackBar(context, 'Produto salvo com sucesso!');
    }
  }
  
  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(text)));
  }
}