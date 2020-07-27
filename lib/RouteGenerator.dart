import 'package:alcool_gasolina/Carros.dart';
import 'package:alcool_gasolina/Home.dart';
import 'package:alcool_gasolina/Resultado.dart';
import 'package:alcool_gasolina/Start.dart';
import 'package:flutter/material.dart';

class RouteGeneretor {
  static const String ROTA_HOME = "/";
  static const String ROTA_CARROS = "/carro";
  static const String ROTA_RESULTADO = "/resultados";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ROTA_HOME:
        return MaterialPageRoute(builder: (_) => Start());
      case ROTA_CARROS:
        return MaterialPageRoute(builder: (_) => Carros());
      case ROTA_RESULTADO:
        return MaterialPageRoute(builder: (_) => Resultado());
      default:
        _errorRoute();
    }
  }
  //

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada!"),
        ),
        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }
}
