import 'package:alcool_gasolina/Carro.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CarroHelper {
  static final CarroHelper _instance = CarroHelper.internal();

  factory CarroHelper() => _instance;

  CarroHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "etanolGasolina.db");

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE carros (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, consumoEtanol REAL, consumoGasolina REAL, tamanhoTanque REAL");
    });
  }

  Future<Carro> save(Carro carro) async {
    print("Salvo: " + carro.toString());
    Database database = await db;
    carro.id = await database.insert('carros', carro.toMap());
    return carro;
  }

  Future<Carro> getById(int id) async {
    Database database = await db;
    List<Map> maps = await database.query('carros',
        columns: [
          'id',
          'nome',
          'consumoEtanol',
          'consumoGasolina',
          'tamanhoTanque'
        ],
        where: 'id = ?',
        whereArgs: [id]);

    if (maps.length > 0) {
      return Carro.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Carro>> getAll() async {
    Database database = await db;
    List listMap = await database.rawQuery("SELECT * FROM carros");
    List<Carro> stuffList = listMap.map((x) => Carro.fromMap(x)).toList();
    print("obter ===========================>: $listMap");
    return stuffList;
  }

  Future<int> update(Carro carro) async {
    print("update Carro ===========================>: $carro");
    Database database = await db;
    return await database.update('carros', carro.toMap(),
        where: 'id = ?', whereArgs: [carro.id]);
  }

  Future<int> delete(int id) async {
    Database database = await db;
    return await database.delete('carros', where: 'id = ?', whereArgs: [id]);
  }
}
