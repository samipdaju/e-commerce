import 'productTypes.dart';
import 'package:nayakoseli/model/productTypes.dart';
import 'package:sqflite/sqflite.dart';

class Databaseclass {
  static Database? _db;


  static int getversion() => 1;
  static final String tablename = "carts";

  static final String col1 = "id";
  static final String col2 = "productName";
  static final String col3 = "description";
  static final String col4 = "rate";
  static final String col5 = "imageUrl";
  static final String col6 = "quantity";


  init() async {
    if (_db != null) {
      return;
    }
    try {
      String pathvalue = await getDatabasesPath();
      _db = await openDatabase(pathvalue + "carts7",
          version: getversion(), onCreate: oncreatecall);
      print("database created");
    } catch (e) {
      print("Error in database creation $e");
    }
  }

  Future<void> oncreatecall(Database db, int version) async {
    await db.execute("CREATE TABLE $tablename("
        "$col1 INTEGER PRIMARY KEY,"
        "$col2 TEXT,"
        "$col3 TEXT,"
        "$col4 TEXT,"
        "$col5 TEXT,"
        "$col6 INTEGER"

        ")");
  }

  insert(Products products) async {
    try {
      var value =
      await _db!.rawQuery('SELECT MAX(id) + 1 AS id FROM $tablename');
      var id = value[0]["$col1"];




      print("Hello id is $id");

      var raw = await _db!.rawInsert(
          "INSERT INTO $tablename($col1,$col2,$col3,$col4,$col5,$col6)"
              "VALUES(?,?,?,?,?,?)",
          [
            id,
            products.productName,
            products.description,
            products.rate,
            products.imageUrl,
            products.quantity


          ]);

      return raw;
    } catch (e) {
      print(e.toString());
    }
  }

  getProduct() async {
    try {
      var res = await _db!.query("$tablename");
      List<Products> carts = [];

      for (int i = 0; i <= res.length - 1; i++) {
        carts.add(Products(
          id: res[i]['$col1'],
          productName: res[i]['$col2'],
          description: res[i]['$col3'],
          rate: res[i]['$col4'],
          imageUrl: res[i]['$col5'],
          quantity: res[i]['$col6']
        ));
      }

      return carts;
    } catch (e) {
      print("hilo${e.toString()}");
    }
  }

  delete(int id) async {
    await _db!.delete(tablename, where: '$col1=?', whereArgs: [id]);
    await _db!.rawQuery("DELETE FROM $tablename WHERE $col1='$id'");
    print("data deleted");
  }

  update(Products products,int id) async {
    try {
      var result = await _db!.rawUpdate("UPDATE $tablename "
          "SET $col6 = '${products.quantity +1}' WHERE $col1 = '$id' " );

      return result;
    }
    catch(e){
      print("Hellooo${e.toString()}");
    }
  }

  updateDecrease(Products products,int id) async {
    try {
      if (products.quantity > 1) {
        var result = await _db!.rawUpdate("UPDATE $tablename "
            "SET $col6 = '${products.quantity - 1}' WHERE $col1 = '$id' ");

        return result;
      }
    }
    catch (e) {
      print("Hellooo${e.toString()}");
    }
  }




}

