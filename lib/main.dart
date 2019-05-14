
import 'package:flutter/material.dart';
import 'package:compra_do_mes/screens/main.screen.dart';

void main() => runApp(CompraDoMesApp());

class CompraDoMesApp extends StatefulWidget {

  @override
  _CompraDoMesAppState createState() => _CompraDoMesAppState();
}

class _CompraDoMesAppState extends State<CompraDoMesApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compra Do Mes',
      theme: ThemeData(
        primaryColor: Color(0xFF4095CA),
        accentColor: Color(0xFFFFAD32),
      ),
      home: MainView(),
    );
  }
}