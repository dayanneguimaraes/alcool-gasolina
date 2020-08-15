import 'dart:math';

import 'package:alcool_gasolina/CarroHelp.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'Carro.dart';

class HomeController {
  MaskedTextController controllerAlcool = MaskedTextController(mask: '0.00');
  MaskedTextController controllerGasolina = MaskedTextController(mask: '0.00');
  String textoResultado = "";
  String carroId = "";
  String porcentagemEconomia = "";
  String autonomiaEtanol = "";
  String autonomiaGasolina = "";
  String valorGasolina = "";
  String valorEtanol = "";
  String valorEconomia100km = "";
  bool isCarroPadrao = true;

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  calcular() {
    double precoAlcool = double.tryParse(controllerAlcool.text);
    double precoGasolina = double.tryParse(controllerGasolina.text);

    Carro carro;

    double resultado = precoAlcool / precoGasolina;
    if (carroId.isEmpty) {
      textoResultado = resultado < 0.7 ? "Etanol" : "Gasolina";
      isCarroPadrao = true;
    } else {
      isCarroPadrao = false;
      CarroHelper _helper = CarroHelper();
      _helper.getById(int.parse(carroId)).then((value) {
        carro = value;
        double tamanhoTanque = carro.tamanhoTanque;
        double consumoEtanol = carro.consumoEtanol;
        double consumoGasolina = carro.consumoGasolina;
        double consumo = (consumoEtanol / consumoGasolina) - (1 / 100);
        textoResultado = resultado < consumo ? "Etanol" : "Gasolina";

        // Calculo valor da economia de 100 km
        double qtdLitros100kmEtanol = 100 / consumoEtanol;
        double valor100kmEtanol = qtdLitros100kmEtanol * precoAlcool;

        double qtdLitros100Gasolina = 100 / consumoGasolina;
        double valor100kmGasolina = qtdLitros100Gasolina * precoGasolina;

        double valEconomia100km = 0;
        double valorTotal = 0;

        if (textoResultado == "Etanol") {
          valEconomia100km = valor100kmGasolina - valor100kmEtanol;
          valorTotal = valor100kmGasolina;
        } else {
          valEconomia100km = valor100kmEtanol - valor100kmGasolina;
          valorTotal = valor100kmEtanol;
        }

        valorEconomia100km = roundDouble(valEconomia100km, 2).toString();

        // Calculo da porcentagem de economia me 100Km
        double porEconomia = (valEconomia100km / valorTotal) * 100;
        porcentagemEconomia = roundDouble(porEconomia, 2).toString();

        // Calculo valor do tanque cheio
        var valEtanol = tamanhoTanque * precoAlcool;
        valorEtanol = roundDouble(valEtanol, 2).toString();

        var valGasolina = tamanhoTanque * precoGasolina;
        valorGasolina = roundDouble(valGasolina, 2).toString();

        // Calculo autonomia do carro
        var autEtanol = consumoEtanol * tamanhoTanque;
        autonomiaEtanol = autEtanol.toString();

        var autGasolina = consumoGasolina * tamanhoTanque;
        autonomiaGasolina = autGasolina.toString();
      });
    }
  }
}

/* Calculo Por Carro:
Consumo = ((km/l alcool)/ (km/l gasolina) ) - 1%
R = alcool/gasolina;
resultado < consumo alcool melhor
resultado > consumo gasolina melhor */
