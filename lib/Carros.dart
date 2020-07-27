import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Carros extends StatefulWidget {
  final Function onTap;
  const Carros({Key key, this.onTap}) : super(key: key);

  @override
  _CarrosState createState() => _CarrosState();
}

class _CarrosState extends State<Carros> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerConsumoEtanol = TextEditingController();
  TextEditingController _controllerConsumoGasolina = TextEditingController();
  TextEditingController _controllerTamanhoTanque = TextEditingController();

  FocusNode nomeFocus;
  FocusNode consumoEtanolFocus;
  FocusNode consumoGasolinaFocus;
  FocusNode tamanhoTanqueFocus;

  @override
  void initState() {
    super.initState();
    nomeFocus = FocusNode();
    consumoEtanolFocus = FocusNode();
    consumoGasolinaFocus = FocusNode();
    tamanhoTanqueFocus = FocusNode();
  }

  @override
  void dispose() {
    nomeFocus.dispose();
    consumoEtanolFocus.dispose();
    consumoGasolinaFocus.dispose();
    tamanhoTanqueFocus.dispose();
    super.dispose();
  }

  void focusNome() {
    setState(() {
      // FocusScope.of(context).requestFocus(nomeFocus);
    });
  }

  void focusConsumoEtanol() {
    setState(() {
      // FocusScope.of(context).requestFocus(consumoEtanolFocus);
    });
  }

  void focusConsumoGasolina() {
    setState(() {
      // FocusScope.of(context).requestFocus(consumoGasolinaFocus);
    });
  }

  void focusTamanhoTanque() {
    setState(() {
      // FocusScope.of(context).requestFocus(tamanhoTanqueFocus);
    });
  }

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

  _salvar() async {
    Database bd = _recuperarBancoDados();
    Map<String, dynamic> dadosCarro = {
      "nome": _controllerNome,
      "consumoEtanol": _controllerConsumoEtanol,
      "consumoGasolina": _controllerConsumoGasolina,
      "tamanhoTanque": _controllerTamanhoTanque
    };

    int id = await bd.insert("carros", dadosCarro);
    print("Salvo: $id");
  }

  @override
  Widget build(BuildContext context) {
    _recuperarBancoDados();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: GestureDetector(
          onTap: widget.onTap,
          child: Icon(Icons.menu),
        ),
        title: Text(
          "Etanol ou Gasolina",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              focusNode: nomeFocus,
              onTap: focusNome,
              decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                      color: nomeFocus.hasFocus ? Colors.red : Colors.black38),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerNome,
              cursorColor: Colors.red,
            ),
            TextField(
              keyboardType: TextInputType.number,
              focusNode: consumoEtanolFocus,
              onTap: focusConsumoEtanol,
              decoration: InputDecoration(
                  labelText: "Consumo de Etanol (Km/litro)",
                  labelStyle: TextStyle(
                      color: consumoEtanolFocus.hasFocus
                          ? Colors.red
                          : Colors.black38),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerConsumoEtanol,
              cursorColor: Colors.red,
            ),
            TextField(
              keyboardType: TextInputType.number,
              focusNode: consumoGasolinaFocus,
              onTap: focusConsumoGasolina,
              decoration: InputDecoration(
                  labelText: "Consumo da Gasolina (Km/litro)",
                  labelStyle: TextStyle(
                      color: consumoGasolinaFocus.hasFocus
                          ? Colors.red
                          : Colors.black38),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerConsumoGasolina,
              cursorColor: Colors.red,
            ),
            TextField(
              keyboardType: TextInputType.number,
              focusNode: tamanhoTanqueFocus,
              onTap: focusTamanhoTanque,
              decoration: InputDecoration(
                  labelText: "Tamanho do Tanque (litro)",
                  labelStyle: TextStyle(
                      color: tamanhoTanqueFocus.hasFocus
                          ? Colors.red
                          : Colors.black38),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerTamanhoTanque,
              cursorColor: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  _salvar();
                  // Navigator.pushReplacementNamed(
                  //     context, RouteGeneretor.ROTA_HOME);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
