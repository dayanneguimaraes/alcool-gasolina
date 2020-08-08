import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomeController {
  MaskedTextController controllerAlcool = MaskedTextController(mask: '0.00');
  MaskedTextController controllerGasolina = MaskedTextController(mask: '0.00');
  String textoResultado = "";

  String _carro = "a";

  calcular() {
    double precoAlcool = double.tryParse(controllerAlcool.text);
    double precoGasolina = double.tryParse(controllerGasolina.text);

    double resultado = precoAlcool / precoGasolina;
    textoResultado = resultado < 0.7 ? "Etanol" : "Gasolina";
  }
}
