import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int itemSelect = 0;

  _navegar(String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

//Cria uma listview com os itens do menu
  Widget _listMenu() {
    return ListView(
      children: <Widget>[
        _topoMenu(),
        // _tiles("Home", Icons.home, 0, _navegarCalcular),
        _tiles("Calcular", Icons.attach_money, 1,
            () => _navegar(RouteGeneretor.ROTA_HOME)),
        _tiles("Carros", Icons.directions_car, 2,
            () => _navegar(RouteGeneretor.ROTA_LISTAGEM_CARROS)),
        Divider(
          color: Colors.white,
        ),
        _tiles("SAIR", Icons.close, 3, () => SystemNavigator.pop()),
      ],
    );
  }

  Widget _topoMenu() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          Image.asset(
            "images/logo.png",
            width: 100,
          ),
          Text(
            "Etanol ou Gasolina",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
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
    return Drawer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: _listMenu(),
      ),
    );
  }
}
