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

  var carros;

  @override
  void initState() {
    /*  carrosController.listar();
    carros = carrosController.carros;
    print(carros); */
    super.initState();
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
  var a = carrosController.carros;
  print(a);
  final itens = List.generate(a.length, (i) => a[i]['nome']);
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
            onTap: () => {},
          ),
          IconSlideAction(
            caption: 'Excluir',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => {},
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
        ),
      );
    },
  );
}
