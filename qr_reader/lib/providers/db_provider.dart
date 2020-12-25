import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';

class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db');
    print(path);
    // Creamos la base de datos en un directorio
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {

        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          );
        ''');

      }
    );
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {

    final id = nuevoScan.id;
    final tipo = nuevoScan.id;
    final valor= nuevoScan.id;

    // Verificar la base de datos
    final db = await database;

    final resp = await db.rawInsert('''
      INSERT INTO Scans( id, tipo, valor )
      VALUES( $id, '$tipo, '$valor');
    ''');

    return resp;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {

    // Verificar la base de datos
    final db = await database;
    final resp = await db.insert('Scans', nuevoScan.toJson());
    return resp;

  }

  Future<ScanModel> getScanById(int i) async {

    // Verificar la base de datos
    final db = await database;
    final resp = await db.query('Scans', where: 'id = ?', whereArgs: [i]);
    return resp.isNotEmpty 
            ? ScanModel.fromJson(resp.first) 
            : null;
  }

  Future<List<ScanModel>> getTodosLosScans() async {
    final db = await database;
    final resp = await db.query('Scans');
    return resp.isNotEmpty 
            ? resp.map((scanModel) => ScanModel.fromJson(scanModel)).toList() 
            : [];
  }

  // Este solo lo hacemos para mostrar que podemos realizar querys personalizadas
  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;
    final resp = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');
    return resp.isNotEmpty 
            ? resp.map((scanModel) => ScanModel.fromJson(scanModel)).toList() 
            : [];
  }

  Future<int> updateScan( ScanModel nuevoScan ) async {
    final db = await database;
    final resp = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);
    return resp;
  }

  Future<int> deleteScan( int id ) async {
    final db = await database;
    final resp = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return resp;
  }

  Future<int> deleteAllScan() async {
    final db = await database;
    final resp = await db.delete('Scans');
    return resp;
  }


}