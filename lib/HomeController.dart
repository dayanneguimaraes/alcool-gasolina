import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomeController {
  MaskedTextController controllerAlcool = MaskedTextController(mask: '0.00');
  MaskedTextController controllerGasolina = MaskedTextController(mask: '0.00');
  String textoResultado = "";

  String carro = "";

  calcular() {
    double precoAlcool = double.tryParse(controllerAlcool.text);
    double precoGasolina = double.tryParse(controllerGasolina.text);

    print(carro);
    double resultado = precoAlcool / precoGasolina;
    if (carro.isEmpty) {
      textoResultado = resultado < 0.7 ? "Etanol" : "Gasolina";
    } else {
      textoResultado = "Teste";
    }
  }
}
