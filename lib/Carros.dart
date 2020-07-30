import 'package:alcool_gasolina/CarrosController.dart';
import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:flutter/material.dart';

class Carros extends StatefulWidget {
  final Function onTap;
  const Carros({Key key, this.onTap}) : super(key: key);

  @override
  _CarrosState createState() => _CarrosState();
}

class _CarrosState extends State<Carros> {
  CarrosController carrosController = CarrosController();
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
      FocusScope.of(context).requestFocus(nomeFocus);
    });
  }

  void focusConsumoEtanol() {
    setState(() {
      FocusScope.of(context).requestFocus(consumoEtanolFocus);
    });
  }

  void focusConsumoGasolina() {
    setState(() {
      FocusScope.of(context).requestFocus(consumoGasolinaFocus);
    });
  }

  void focusTamanhoTanque() {
    setState(() {
      FocusScope.of(context).requestFocus(tamanhoTanqueFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              controller: carrosController.controllerNome,
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
              controller: carrosController.controllerConsumoEtanol,
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
              controller: carrosController.controllerConsumoGasolina,
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
              controller: carrosController.controllerTamanhoTanque,
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
                  carrosController.salvar();
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
