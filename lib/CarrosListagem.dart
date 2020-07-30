import 'package:alcool_gasolina/CarrosController.dart';
import 'package:alcool_gasolina/CarrosListagemController.dart';
import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:flutter/material.dart';

class CarrosListagem extends StatefulWidget {
  final Function onTap;
  const CarrosListagem({Key key, this.onTap}) : super(key: key);

  @override
  _CarrosListagemState createState() => _CarrosListagemState();
}

class _CarrosListagemState extends State<CarrosListagem> {
  CarrosListagemController carrosController = CarrosListagemController();

  Widget _cardCarros(nomeCarro) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.directions_car,
            color: Colors.red,
          ),
          title: Text(
            "Carro:" + nomeCarro,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            // textAlign: TextAlign.center,
          ),
          subtitle: Text("Consumo Etanol"),
        )
      ]),
    );
  }

  Widget _listCarros() {
    carrosController.listar();
    var test = carrosController.carros;
    List<Widget> lista = List.generate(test.length, (index) {
      var a = test[index]['nome'];
      // var la = a.nome;
      print('item $a');
      return _cardCarros(test[index]['nome']);
    });

    return Column(
      children: lista,
    );
  }

  // List.generate(text.length,(index){
  //           return Text(text[index].toString());
  //         }),

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
        // padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _listCarros(),
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
                  // carrosController.salvar();
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
