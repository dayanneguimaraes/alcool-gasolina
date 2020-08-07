import 'package:alcool_gasolina/HomeController.dart';
import 'package:alcool_gasolina/Menu.dart';
import 'package:alcool_gasolina/Resultado.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Function onTap;

  const Home({Key key, this.onTap}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var homeController = new HomeController();
  FocusNode alcoolFocus;
  FocusNode gasolinaFocus;

  @override
  void initState() {
    super.initState();
    alcoolFocus = FocusNode();
    gasolinaFocus = FocusNode();
  }

  @override
  void dispose() {
    alcoolFocus.dispose();
    gasolinaFocus.dispose();
    super.dispose();
  }

  void focusAlcool() {
    setState(() {
      FocusScope.of(context).requestFocus(alcoolFocus);
    });
  }

  void focusGasolina() {
    setState(() {
      FocusScope.of(context).requestFocus(gasolinaFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawer: Drawer(
        child: Menu(),
        /*  child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Etanol ou Gasolina",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ), */
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                focusNode: alcoolFocus,
                onTap: focusAlcool,
                decoration: InputDecoration(
                    labelText: "Etanol",
                    labelStyle: TextStyle(
                        color:
                            alcoolFocus.hasFocus ? Colors.red : Colors.black38),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: homeController.controllerAlcool,
                cursorColor: Colors.red,
              ),
              TextField(
                keyboardType: TextInputType.number,
                focusNode: gasolinaFocus,
                onTap: focusGasolina,
                decoration: InputDecoration(
                    labelText: "Gasolina",
                    labelStyle: TextStyle(
                        color: gasolinaFocus.hasFocus
                            ? Colors.red
                            : Colors.black38),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: homeController.controllerGasolina,
                cursorColor: Colors.red,
              ),
              // DropdownButton<String>(
              //   value: _carro,
              //   style: TextStyle(
              //     color: Colors.red,
              //   ),
              //   underline: Container(
              //     height: 1,
              //     color: Colors.red,
              //   ),
              //   onChanged: (String newValue) {
              //     setState(() {
              //       _carro = newValue;
              //     });
              //   },
              //   items: <String>['a', 'b']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    homeController.calcular();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Resultado(
                                resultado: homeController.textoResultado,
                              )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
