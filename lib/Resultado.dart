import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:alcool_gasolina/admob_service.dart';
import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final String resultado;
  final String porcentagemEconomia;
  final String valorEconomia100km;
  final String autonomiaEtanol;
  final String autonomiaGasolina;
  final String valorGasolina;
  final String valorEtanol;
  final bool isCarroPadrao;

  const Resultado(
      {Key key,
      this.resultado,
      this.porcentagemEconomia,
      this.valorEconomia100km,
      this.autonomiaEtanol,
      this.valorGasolina,
      this.valorEtanol,
      this.isCarroPadrao,
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
        leading: GestureDetector(
          onTap: () {
            AdMobService().mostrarInterstitial(context);
          },
          child: Icon(Icons.arrow_back),
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
            (widget.isCarroPadrao == true
                ? Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.monetization_on,
                            color: Colors.red,
                          ),
                          title: Text(
                            "Resultado com base no valor padrão que o etanol rende aproximadamente 70% da Gasolina. Para mais informaçoes e cálculos cadastre o seu carro.",
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
                  )
                : Column(children: <Widget>[
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
                              "Valor de Economia em 100Km: R\$ ${widget.valorEconomia100km}",
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
                    )
                  ])),
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
                  AdMobService().mostrarInterstitial(context);
                  // Navigator.pushReplacementNamed(
                  // context, RouteGeneretor.ROTA_HOME);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
