import 'package:alcool_gasolina/Carro.dart';
import 'package:alcool_gasolina/CarroHelp.dart';
import 'package:alcool_gasolina/HomeController.dart';
import 'package:alcool_gasolina/Menu.dart';
import 'package:alcool_gasolina/Resultado.dart';
import 'package:alcool_gasolina/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Flushbar.dart';

class Home extends StatefulWidget {
  final Function onTap;

  const Home({Key key, this.onTap}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var homeController = new HomeController();
  FocusNode alcoolFocus;
  FocusNode gasolinaFocus;

  List<Carro> _carroList = [];
  CarroHelper _helper = CarroHelper();

  @override
  void initState() {
    super.initState();
    AdMobService().mostrarBanner();
    alcoolFocus = FocusNode();
    gasolinaFocus = FocusNode();
    _helper.getAll().then((value) {
      setState(() {
        _carroList = value;
      });
    });
  }

  @override
  void dispose() {
    AdMobService().bannerAd.dispose();
    alcoolFocus.dispose();
    gasolinaFocus.dispose();
    super.dispose();
  }

  void focusAlcool() {
    setState(() {
      FocusScope.of(context).requestFocus(alcoolFocus);
    });
  }

  void focusGasolina() {
    setState(() {
      FocusScope.of(context).requestFocus(gasolinaFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    final lista = List.generate(_carroList.length, (i) => _carroList[i]);

    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Icon(Icons.menu),
          ),
          title: Text(
            "Etanol ou Gasolina",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Menu(),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  focusNode: alcoolFocus,
                  onTap: focusAlcool,
                  decoration: InputDecoration(
                    labelText: "Etanol",
                    labelStyle: TextStyle(
                        color:
                            alcoolFocus.hasFocus ? Colors.red : Colors.black38),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: homeController.controllerAlcool,
                  cursorColor: Colors.red,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  focusNode: gasolinaFocus,
                  onTap: focusGasolina,
                  decoration: InputDecoration(
                    labelText: "Gasolina",
                    labelStyle: TextStyle(
                        color: gasolinaFocus.hasFocus
                            ? Colors.red
                            : Colors.black38),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: homeController.controllerGasolina,
                  cursorColor: Colors.red,
                ),
                DropdownButton<String>(
                  value: homeController.carroId.isNotEmpty
                      ? homeController.carroId
                      : null,
                  isExpanded: true,
                  hint: Text(
                    "Selecione um carro",
                    style: TextStyle(color: Colors.red),
                  ),
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  underline: Container(
                    height: 1,
                    color: Colors.red,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      homeController.carroId = newValue;
                    });
                  },
                  items: lista.map<DropdownMenuItem<String>>((Carro carro) {
                    return DropdownMenuItem<String>(
                      value: carro.id.toString(),
                      child: Text(carro.nome),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      String mensagem = "";
                      if (homeController.controllerAlcool.text == "") {
                        mensagem += ", Etanol ";
                      }
                      if (homeController.controllerGasolina.text == "") {
                        mensagem += ", Gasolina ";
                      }
                      if (mensagem != "") {
                        mensagem = mensagem.substring(1);
                        mensagemAlerta(
                            "Preencha o(s) campo(s): " + mensagem, context);
                      } else {
                        homeController.calcular();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Resultado(
                              resultado: homeController.textoResultado,
                              porcentagemEconomia:
                                  homeController.porcentagemEconomia,
                              valorEconomia100km:
                                  homeController.valorEconomia100km,
                              autonomiaEtanol: homeController.autonomiaEtanol,
                              autonomiaGasolina:
                                  homeController.autonomiaGasolina,
                              valorGasolina: homeController.valorGasolina,
                              valorEtanol: homeController.valorEtanol,
                              isCarroPadrao: homeController.isCarroPadrao,
                            ),
                          ),
                        );
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
