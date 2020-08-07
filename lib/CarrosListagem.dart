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
/* 
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
          onLongPress: () {
            // do something else
          },
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
 */
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
      //Dayanne
      /*  body: Container(
        child: SingleChildScrollView(
          // padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _listCarros(),
            ],
          ),
        ),
      ), */
      body: buidListView(carrosController),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, RouteGeneretor.ROTA_CARROS);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}

buidListView(carrosController) {
  carrosController.listar();
  var test = carrosController.carros;
  final itens = List.generate(test.length, (i) => test[i]['nome']);
  return ListView.builder(
    itemCount: itens.length,
    itemBuilder: (context, index) {
      return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.directions_car,
                color: Colors.red,
              ),
              title: Text(
                "Carro: ${itens[index]}",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                // textAlign: TextAlign.center,
              ),
              onLongPress: () {
                // do something else
              },
              subtitle: Text("Consumo Etanol"),
            )
          ],
        ),
      );
    },
  );
}
