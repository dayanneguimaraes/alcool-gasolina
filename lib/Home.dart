import 'package:alcool_gasolina/Carro.dart';
import 'package:alcool_gasolina/CarroHelp.dart';
import 'package:alcool_gasolina/HomeController.dart';
import 'package:alcool_gasolina/Menu.dart';
import 'package:alcool_gasolina/Resultado.dart';
import 'package:alcool_gasolina/admob_service.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  final Function onTap;

  const Home({Key key, this.onTap}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var homeController = new HomeController();
  //String carro = "";
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

  Flushbar flushbar;
  void mensagemAlerta(String mensagem) {
    flushbar = Flushbar(
      title: "Erro",
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
            color: Colors.red[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.red[300], Colors.red[900]]),
      isDismissible: false,
      duration: Duration(seconds: 4),
      icon: Icon(
        Icons.error,
        color: Colors.redAccent[700],
      ),
      mainButton: FlatButton(
        onPressed: () {
          flushbar.dismiss();
        },
        child: Text(
          "EXIT",
          style: TextStyle(color: Colors.white),
        ),
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "Erro",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
      messageText: Text(
        mensagem,
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    )..show(context);
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
                      if (homeController.controllerAlcool.text == "") {
                        this.mensagemAlerta("Preencha o campo Etanol");
                      } else if (homeController.controllerGasolina.text == "") {
                        this.mensagemAlerta("Preencha o campo Gasolina");
                      } else {
                        homeController.calcular();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Resultado(
                              resultado: homeController.textoResultado,
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
