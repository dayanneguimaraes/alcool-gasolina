import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Qual é melhor ?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.only(bottom: 32),
            //   child: Image.asset(
            //     "images/logo.png",
            //     scale: 4,
            //   ),
            // ),
            Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.local_gas_station,
                  color: Colors.red,
                ),
                title: Text(
                  "Gasolina",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
                // subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              )
            ])),
            Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.monetization_on,
                  color: Colors.red,
                ),
                title: Text(
                  "Porcentagem de Economia:",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              )
            ])),
            Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.monetization_on,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Valor de Economia:",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                )
              ]),
            ),
            Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.directions_car,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Autonomia Etanol:",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                )
              ]),
            ),
            Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.directions_car,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Autonomia Gasolina:",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Verificar Novamente",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.update,
                        color: Colors.white,
                      ),
                    ]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Resultado()),
                  );
                },
              ),
            ),
          ],
        )));
  }
}
