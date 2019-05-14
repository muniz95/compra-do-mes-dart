import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:compra_do_mes/models/product.model.dart';

class ProductFormScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ProductFormScreenState();
}

class ProductFormScreenState extends State<ProductFormScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _name;
  double _price;
  int _quantity;

  @override
  Widget build(BuildContext context) {
    var saveBtn = RaisedButton(
      onPressed: () => _submit(context),
      child: Text("Salvar"),
      color: Theme.of(context).primaryColor,
    );
    var loginForm = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (val) => _name = val,
                  validator: _validateProductName,
                  decoration: InputDecoration(labelText: "Produto"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => _price = double.parse(val),
                  decoration: InputDecoration(labelText: "Preço"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => _quantity = int.parse(val),
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
      body: Container(
        child: Center(
          child: loginForm,
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
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (form.validate()) {
      form.save();
      Product product = Product(name: _name, price: _price, quantity: _quantity);
      print(product);
      form.reset();
      _showSnackBar(context, 'Produto salvo com sucesso!');
    }
  }
  
  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}