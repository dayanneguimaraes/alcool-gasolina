import 'dart:ffi';

import 'package:alcool_gasolina/Carro.dart';
import 'package:alcool_gasolina/CarroHelp.dart';
import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'Flushbar.dart';

class Carros extends StatefulWidget {
  final Function onTap;
  final Carro carro;
  const Carros({Key key, this.onTap, this.carro}) : super(key: key);

  @override
  _CarrosState createState() => _CarrosState();
}

class _CarrosState extends State<Carros> {
  CarroHelper _helper = CarroHelper();
  TextEditingController controllerNome = TextEditingController();
  var controllerConsumoEtanol = MoneyMaskedTextController();
  var controllerConsumoGasolina = MoneyMaskedTextController();
  var controllerTamanhoTanque = MoneyMaskedTextController();

  FocusNode nomeFocus;
  FocusNode consumoEtanolFocus;
  FocusNode consumoGasolinaFocus;
  FocusNode tamanhoTanqueFocus;

  Carro _currentCarro = Carro();

  @override
  void initState() {
    super.initState();
    nomeFocus = FocusNode();
    consumoEtanolFocus = FocusNode();
    consumoGasolinaFocus = FocusNode();
    tamanhoTanqueFocus = FocusNode();

    if (widget.carro != null) {
      _currentCarro = Carro.fromMap(widget.carro.toMap());
      controllerNome.text =
          _currentCarro.nome != null ? _currentCarro.nome : '';
      controllerConsumoEtanol.text =
          _currentCarro.consumoEtanol.toString() != null
              ? _currentCarro.consumoEtanol.toString()
              : '0,00';
      controllerConsumoGasolina.text =
          _currentCarro.consumoGasolina.toString() != null
              ? _currentCarro.consumoGasolina.toString()
              : '';
      controllerTamanhoTanque.text =
          _currentCarro.tamanhoTanque.toString() != null
              ? _currentCarro.tamanhoTanque.toString()
              : '';
    }
  }

  @override
  void dispose() {
    controllerNome.clear();
    controllerConsumoEtanol.clear();
    controllerConsumoGasolina.clear();
    controllerTamanhoTanque.clear();

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

  void _salvar() {
    _currentCarro.nome = controllerNome.value.text;
    _currentCarro.consumoEtanol =
        double.tryParse(controllerConsumoEtanol.text.replaceAll(',', '.'));
    _currentCarro.consumoGasolina =
        double.tryParse(controllerConsumoGasolina.text.replaceAll(',', '.'));
    _currentCarro.tamanhoTanque =
        double.tryParse(controllerTamanhoTanque.text.replaceAll(',', '.'));

    if (_currentCarro.id == null) {
      _helper.save(_currentCarro);
    } else {
      _helper.update(_currentCarro);
    }
    Navigator.pushReplacementNamed(
        context, RouteGeneretor.ROTA_LISTAGEM_CARROS);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(
            context, RouteGeneretor.ROTA_LISTAGEM_CARROS);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, RouteGeneretor.ROTA_LISTAGEM_CARROS);
            },
            child: Icon(Icons.arrow_back),
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
                          color:
                              nomeFocus.hasFocus ? Colors.red : Colors.black38),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: controllerNome,
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
                  controller: controllerConsumoEtanol,
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
                  controller: controllerConsumoGasolina,
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
                  controller: controllerTamanhoTanque,
                  cursorColor: Colors.red,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "${_currentCarro.id != null ? 'Editar' : 'Salvar'}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      String mensagem = "";
                      if (controllerNome.text == "") {
                        mensagem += ", nome ";
                      }
                      if (controllerConsumoEtanol.text == "0,00") {
                        mensagem += ", consumo de etanol";
                      }
                      if (controllerConsumoGasolina.text == "0,00") {
                        mensagem += ", consumo de gasolina";
                      }
                      if (controllerTamanhoTanque.text == "0,00") {
                        mensagem += ", tamanho do tanque";
                      }
                      if (mensagem != "") {
                        mensagem = mensagem.substring(1);
                        mensagemAlerta(
                            "Preencha o(s) campo(s): " + mensagem, context);
                      } else {
                        _salvar();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
