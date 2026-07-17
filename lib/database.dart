import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instancia = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('usuarios.db');
    return _database!;
  }

  Future<Database> _initDB(String nombreBD) async {
    final rutaBD = await getDatabasesPath();
    final ruta = join(rutaBD, nombreBD);

    return await openDatabase(
      ruta,
      version: 1,
      onCreate: _crearBD,
    );
  }

  Future _crearBD(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario TEXT UNIQUE,
        password TEXT
      )
    ''');
  }

  Future<int> registrarUsuario(String usuario, String password) async {
    final db = await database;

    return await db.insert(
      'usuarios',
      {
        'usuario': usuario,
        'password': password,
      },
    );
  }

  Future<Map<String, dynamic>?> buscarUsuario(String usuario) async {
    final db = await database;

    final resultado = await db.query(
      'usuarios',
      where: 'usuario = ?',
      whereArgs: [usuario],
    );

    if (resultado.isNotEmpty) {
      return resultado.first;
    }

    return null;
  }
}