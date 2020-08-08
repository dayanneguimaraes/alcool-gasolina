import 'package:alcool_gasolina/Carro.dart';
import 'package:alcool_gasolina/CarroHelp.dart';
import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'Menu.dart';

class CarrosListagem extends StatefulWidget {
  final Function onTap;
  const CarrosListagem({Key key, this.onTap}) : super(key: key);

  @override
  _CarrosListagemState createState() => _CarrosListagemState();
}

class _CarrosListagemState extends State<CarrosListagem> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Carro> _carroList = [];
  CarroHelper _helper = CarroHelper();

  @override
  void initState() {
    super.initState();
    _helper.getAll().then((value) {
      setState(() {
        _carroList = value;
      });
    });
  }

  void onEditar(Carro carro) {
    Navigator.pushReplacementNamed(context, RouteGeneretor.ROTA_EDICAO_CARRO,
        arguments: carro);
  }

  void onExcluir({Carro deletedCarro, int index}) {
    setState(() {
      _carroList.removeAt(index);
    });

    _helper.delete(deletedCarro.id);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, RouteGeneretor.ROTA_HOME);
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: GestureDetector(
            //onTap: widget.onTap,
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
        body: buidListView(),
        drawer: Menu(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, RouteGeneretor.ROTA_CARROS);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }

  Widget buidListView() {
    if (_carroList.isEmpty) {
      return Center(
        child: Text("Não há registro de carros!"),
      );
    } else {
      return ListView.builder(
        itemCount: _carroList.length,
        itemBuilder: (context, index) {
          final carro = _carroList[index];
          return Slidable(
            actionPane: SlidableDrawerDismissal(),
            actionExtentRatio: 0.2,
            closeOnScroll: true,
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Editar',
                color: Colors.black45,
                icon: Icons.edit,
                onTap: () => onEditar(carro),
              ),
              IconSlideAction(
                caption: 'Excluir',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () =>
                    {onExcluir(deletedCarro: _carroList[index], index: index)},
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
                      "Carro: ${carro.nome}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onLongPress: () {
                      // do something else
                    },
                    subtitle: Text("Consumo Etanol: ${carro.consumoEtanol}"),
                  )
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
