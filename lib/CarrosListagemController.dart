import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CarrosListagemController {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerConsumoEtanol = TextEditingController();
  TextEditingController controllerConsumoGasolina = TextEditingController();
  TextEditingController controllerTamanhoTanque = TextEditingController();
  List carros = List();

  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "etanolGasolina.db");

    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE carros (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, consumoEtanol REAL, consumoGasolina REAL, tamanhoTanque REAL)";
      db.execute(sql);
    });
    // print("aberto: " + retorno.isOpen.toString());
    return bd;
  }

  // salvar() async {
  //   Database bd = await _recuperarBancoDados();
  //   Map<String, dynamic> dadosCarro = {
  //     "nome": controllerNome.text,
  //     "consumoEtanol": controllerConsumoEtanol.text,
  //     "consumoGasolina": controllerConsumoGasolina.text,
  //     "tamanhoTanque": controllerTamanhoTanque.text
  //   };

  //   // Map<String, dynamic> dadosCarro = {
  //   //   "nome": "teste",
  //   //   "consumoEtanol": 7464,
  //   //   "consumoGasolina": 66353,
  //   //   "tamanhoTanque": 3232
  //   // };

  //   int id = await bd.insert("carros", dadosCarro);
  //   print("Salvo: $id");
  // }

  listar() async {
    Database bd = await _recuperarBancoDados();

    String sql = "SELECT * FROM carros";

    List listaCarros = await bd.rawQuery(sql);
    // List
    //print("Lista: $carros");
  }

  Future<int> excluir(int id) async {
    Database bd = await _recuperarBancoDados();

    return await bd.delete('carros', where: "id = ?", whereArgs: [id]);
  }
}

// Future<List<Task>> getAll() async {
//     Database database = await db;
//     List listMap = await database.rawQuery("SELECT * FROM task");
//     List<Task> stuffList = listMap.map((x) => Task.fromMap(x)).toList();
//     return stuffList;
//   }
