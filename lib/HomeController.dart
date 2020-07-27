import 'package:flutter/material.dart';

class HomeController {
  TextEditingController controllerAlcool = TextEditingController();
  TextEditingController controllerGasolina = TextEditingController();
  String textoResultado = "";

  String _carro = "a";

  calcular() {
    double precoAlcool = double.tryParse(controllerAlcool.text);
    double precoGasolina = double.tryParse(controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      //Apresentar erro
    } else {
      double resultado = precoAlcool / precoGasolina;
      textoResultado = resultado < 0.7 ? "Etanol" : "Gasolina";
    }
  }
}
