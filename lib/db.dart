import 'package:sqflite/sqflite.dart';
import 'persona.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'personas.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE personas (id INTEGER PRIMARY KEY, nombre TEXT, apellidos TEXT)",
      );
    }, version: 1);
  }

  static Future<Future<void>> insert(Persona persona) async {
    Database database = await _openDB();
    return database.insert("personas", persona.toMap());
  }

  static Future<Future<void>> delete(Persona persona) async {
    Database database = await _openDB();
    return database.delete("personas", where: "id= ?", whereArgs: [persona.id]);
  }

  static Future<Future<void>> update(Persona persona) async {
    Database database = await _openDB();
    return database.update("personas", persona.toMap(),
        where: "id=?", whereArgs: [persona.id]);
  }

  static Future<List<Persona>> personas() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> personaMap =
        await database.query("personas");
    return List.generate(
        personaMap.length,
        (i) => Persona(
            id: personaMap[i]['id'],
            nombre: personaMap[i]['nombre'],
            apellidos: personaMap[i]['apellidos']));
  }
}
