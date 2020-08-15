import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final String resultado;
  final String porcentagemEconomia;
  final String valorEconomia100km;
  final String autonomiaEtanol;
  final String autonomiaGasolina;
  final String valorGasolina;
  final String valorEtanol;

  const Resultado(
      {Key key,
      this.resultado,
      this.porcentagemEconomia,
      this.valorEconomia100km,
      this.autonomiaEtanol,
      this.valorGasolina,
      this.valorEtanol,
      this.autonomiaGasolina})
      : super(key: key);

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
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.local_gas_station,
                      color: Colors.red,
                    ),
                    title: Text(
                      widget.resultado,
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.monetization_on,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Porcentagem de Economia em 100Km: ${widget.porcentagemEconomia}%",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.monetization_on,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Valor de Economia em 100Km: ${widget.valorEconomia100km}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.directions_car,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Valor do tanque cheio com etanol é R\$ ${widget.valorEtanol} com Autonomia de ${widget.autonomiaEtanol}km",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.directions_car,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Valor Tanque cheio com Gasolina é R\$ ${widget.valorGasolina} com uma Autonomia de ${widget.autonomiaGasolina}km",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
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
                  ],
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteGeneretor.ROTA_HOME);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
