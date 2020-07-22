import 'package:alcool_gasolina/Resultado.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Function onTap;

  const Home({Key key, this.onTap}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";
  FocusNode alcoolFocus;
  FocusNode gasolinaFocus;
  String _carro = "a";

  @override
  void initState() {
    super.initState();
    alcoolFocus = FocusNode();
    gasolinaFocus = FocusNode();
  }

  @override
  void dispose() {
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

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite números maiores que 0 e utilizando .";
      });
    } else {
      if ((precoAlcool / precoGasolina >= 0.7)) {
        setState(() {
          _textoResultado = "Gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Etanol";
        });
      }
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
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
              keyboardType: TextInputType.number,
              focusNode: alcoolFocus,
              onTap: focusAlcool,
              decoration: InputDecoration(
                  labelText: "Etanol",
                  labelStyle: TextStyle(
                      color:
                          alcoolFocus.hasFocus ? Colors.red : Colors.black38),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerAlcool,
              cursorColor: Colors.red,
            ),
            TextField(
              keyboardType: TextInputType.number,
              focusNode: gasolinaFocus,
              onTap: focusGasolina,
              decoration: InputDecoration(
                  labelText: "Gasolina",
                  labelStyle: TextStyle(
                      color:
                          gasolinaFocus.hasFocus ? Colors.red : Colors.black38),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerGasolina,
              cursorColor: Colors.red,
            ),
            DropdownButton<String>(
              value: _carro,
              style: TextStyle(
                color: Colors.red,
              ),
              underline: Container(
                height: 1,
                color: Colors.red,
              ),
              onChanged: (String newValue) {
                setState(() {
                  _carro = newValue;
                });
              },
              items: <String>['a', 'b']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Resultado()),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
