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

    carros = await bd.rawQuery(sql);
    print("Lista: $carros");
  }
}
