import 'package:alcool_gasolina/Carros.dart';
import 'package:alcool_gasolina/Home.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int itemSelect = 0;

  _navegar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Carros()),
    );
  }

  _navegarCalcular() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

//Cria uma listview com os itens do menu
  Widget _listMenu() {
    return ListView(
      children: <Widget>[
        _topoMenu(),
        _tiles("Home", Icons.home, 0, _navegarCalcular),
        _tiles("Calcular", Icons.attach_money, 1, _navegarCalcular),
        _tiles("Carros", Icons.directions_car, 2, _navegar),
        Divider(),
        _tiles("SAIR", Icons.close, 3, () {}),
      ],
    );
  }

  Widget _topoMenu() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          Text(
            "Etanol ou Gasolina",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

//cria cada item do menu
  Widget _tiles(String text, IconData icon, int item, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      onTap: onTap,
      selected: item == itemSelect,
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
          child: _listMenu()),
    );
  }
}
