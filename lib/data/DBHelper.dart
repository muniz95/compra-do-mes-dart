import 'dart:async';
import 'dart:io' as io;

import 'package:compra_do_mes/models/Product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "compra-do-mes.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }
  
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
    "CREATE TABLE Product(id INTEGER PRIMARY KEY, name TEXT, price DOUBLE, quantity INTEGER)");
    print("Created tables");
  }

  Future<int> saveProduct(Product product) async {
    var dbClient = await db;
    int res = await dbClient.insert("Product", product.toMap());
    return res;
  }

  Future<int> deleteProducts() async {
    var dbClient = await db;
    int res = await dbClient.delete("Product");
    return res;
  }

}