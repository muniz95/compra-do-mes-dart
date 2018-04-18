
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:compra_do_mes/redux/app/AppState.dart';
import 'package:compra_do_mes/redux/app/AppActions.dart';
import 'package:compra_do_mes/redux/Store.dart';
import 'package:compra_do_mes/views/MainView.dart';
import 'package:redux/redux.dart';

Future<Null> main() async {
  // ignore: deprecated_member_use
  MaterialPageRoute.debugEnableFadingRoutes = true;

  var store = await createStore();
  runApp(new CompraDoMesApp(store));
}

class CompraDoMesApp extends StatefulWidget {
  CompraDoMesApp(this.store);
  final Store<AppState> store;

  @override
  _CompraDoMesAppState createState() => new _CompraDoMesAppState();
}

class _CompraDoMesAppState extends State<CompraDoMesApp> {
  @override
  void initState() {
    super.initState();
    widget.store.dispatch(new InitAction());
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
        title: 'Compra Do Mes',
        theme: new ThemeData(
          primaryColor: new Color(0xFF4095CA),
          accentColor: new Color(0xFFFFAD32),
        ),
        home: new MainView(),
      ),
    );
  }
}