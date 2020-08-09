import 'package:alcool_gasolina/CarroHelp.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'Carro.dart';

class HomeController {
  MaskedTextController controllerAlcool = MaskedTextController(mask: '0.00');
  MaskedTextController controllerGasolina = MaskedTextController(mask: '0.00');
  String textoResultado = "";
  String carroId = "";
  String porcentagemEconomia = "";
  String valorEconomia = "";
  String autonomiaEtanol = "";
  String autonomiaGasolina = "";

  calcular() {
    double precoAlcool = double.tryParse(controllerAlcool.text);
    double precoGasolina = double.tryParse(controllerGasolina.text);

    Carro carro;

    double resultado = precoAlcool / precoGasolina;
    if (carroId.isEmpty) {
      textoResultado = resultado < 0.7 ? "Etanol" : "Gasolina";
    } else {
      CarroHelper _helper = CarroHelper();
      _helper.getById(int.parse(carroId)).then((value) {
        carro = value;
        double tamanhoTanque = carro.tamanhoTanque;
        double consumoEtanol = carro.consumoEtanol;
        double consumoGasolina = carro.consumoGasolina;
        double consumo = (consumoEtanol / consumoGasolina) - (1 / 100);
        textoResultado = resultado < consumo ? "Etanol" : "Gasolina";

        double valorEtanol = tamanhoTanque * precoAlcool;
        autonomiaEtanol = (consumoEtanol * tamanhoTanque).toString();

        double valorGasolina = tamanhoTanque * precoGasolina;
        autonomiaGasolina = (consumoGasolina * tamanhoTanque).toString();

        valorEconomia = (valorGasolina - valorEtanol).toString();

        porcentagemEconomia = ((valorGasolina - valorEtanol) * 100).toString();
      });
    }
  }
}

/* Calculo Por Carro:
Consumo = ((km/l alcool)/ (km/l gasolina) ) - 1%
R = alcool/gasolina;
resultado < consumo alcool melhor
resultado > consumo gasolina melhor */
