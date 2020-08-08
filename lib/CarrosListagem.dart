import 'package:alcool_gasolina/CarrosListagemController.dart';
import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CarrosListagem extends StatefulWidget {
  final Function onTap;
  const CarrosListagem({Key key, this.onTap}) : super(key: key);

  @override
  _CarrosListagemState createState() => _CarrosListagemState();
}

class _CarrosListagemState extends State<CarrosListagem> {
  CarrosListagemController carrosController = CarrosListagemController();

  List carros = new List();
  // var carros = [];

  @override
  void initState() {
    carros = carrosController.listar();
    // carros = carrosController.carros;
    // print(carros); */
    super.initState();
  }

  void onEditar() {
    Navigator.pushReplacementNamed(context, RouteGeneretor.ROTA_CARROS);
  }

  void onExcluir(id) {
    print('id: ' + id);
    carrosController.excluir(id);
    carros = carrosController.listar();
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
      body: buidListView(carrosController, onEditar, onExcluir, carros),
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

buidListView(carrosController, onEditar, onExcluir, carros) {
  // carrosController.listar();
  // carros = carrosController.carros;
  final itens = List.generate(carros.length, (i) => carros[i]);
  return ListView.builder(
    itemCount: itens.length,
    itemBuilder: (context, index) {
      return Slidable(
        actionPane: SlidableDrawerDismissal(),
        actionExtentRatio: 0.2,
        closeOnScroll: true,
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Editar',
            color: Colors.black45,
            icon: Icons.edit,
            onTap: onEditar,
          ),
          IconSlideAction(
            caption: 'Excluir',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => {onExcluir(itens[index]['id'].toString())},
          ),
        ],
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.red,
                ),
                title: Text(
                  "Carro: ${itens[index]['nome']}",
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
                subtitle: Text("Consumo Etanol:"),
              )
            ],
          ),
        ),
      );
    },
  );
}
