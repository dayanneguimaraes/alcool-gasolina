import 'package:alcool_gasolina/CarroHelp.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'Carro.dart';

class HomeController {
  MaskedTextController controllerAlcool = MaskedTextController(mask: '0.00');
  MaskedTextController controllerGasolina = MaskedTextController(mask: '0.00');
  String textoResultado = "";

  String carroId = "";

  calcular() {
    double precoAlcool = double.tryParse(controllerAlcool.text);
    double precoGasolina = double.tryParse(controllerGasolina.text);

    Carro carro;
    CarroHelper _helper = CarroHelper();
    _helper.getById(int.parse(carroId)).then((value) {
      print(value.consumoEtanol);
      //carro = value as Carro;
    });

/* List<Carro> _carroList = [];
  CarroHelper _helper = CarroHelper();
  _helper.getAll().then((value) {
      setState(() {
        _carroList = value;
      });
    }); */

    print(carroId);
    double resultado = precoAlcool / precoGasolina;
    if (carroId.isEmpty) {
      textoResultado = resultado < 0.7 ? "Etanol" : "Gasolina";
    } else {
      textoResultado = "Teste";
    }
  }
}

/* Calculo Por Carro:
Consumo = ((km/l alcool)/ (km/l gasolina) ) - 1%
R = alcool/gasolina;
resultado < consumo alcool melhor
resultado > consumo gasolina melhor */
