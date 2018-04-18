import 'dart:ui';

import 'package:compra_do_mes/models/Product.dart';
import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:compra_do_mes/redux/product/ProductActions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProductForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new ProductFormContent();
}

class ProductFormContent extends State<ProductForm> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _name;
  double _price;
  int _quantity;

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
                  onSaved: (val) => _name = val,
                  validator: _validateProductName,
                  decoration: new InputDecoration(labelText: "Produto"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => _price = double.parse(val),
                  decoration: new InputDecoration(labelText: "Preço"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => _quantity = int.parse(val),
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
      var store = StoreProvider.of<AppState>(context);
      store.dispatch(new AddProductAction(
        new Product(name: _name, price: _price, quantity: _quantity)
      ));
      form.reset();
      _showSnackBar(context, 'Produto salvo com sucesso!');
    }
  }
  
  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(text)));
  }
}