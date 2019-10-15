import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:qrreaderapp/src/models/scan.model.dart';
export 'package:qrreaderapp/src/models/scan.model.dart';
class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Scans.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Scans (id INTEGER PRIMARY KEY, tipo TEXT, valor TEXT)');
    });
  }

  //CREAR Registros
  nuevoScranRaw(ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.rawInsert("INSERT Into Scans(id, tipo, valor) "
        "VALUES (${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor})'");

    return res;
  }

  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    return res;
  }

  //SELECT
  Future<ScanModel> getScanId(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAll() async {
    final db = await database;
    final res = await db.query('Scans');
    List<ScanModel> list = res.isNotEmpty
        ? res.map((item) => ScanModel.fromJson(item)).toList()
        : [];
    return list;
  }

  Future<List<ScanModel>> getAllTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo='$tipo'");
    List<ScanModel> list = res.isNotEmpty
        ? res.map((item) => ScanModel.fromJson(item)).toList()
        : [];
    return list;
  }

  //ACTUALIZAR
  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  //ELIMINAR
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Scans');
    return res;
  }

}
