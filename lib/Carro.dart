import 'dart:ffi';

class Carro {
  int id;
  String nome;
  double consumoEtanol;
  double consumoGasolina;
  double tamanhoTanque;

  Carro(
      {this.id,
      this.nome,
      this.consumoEtanol,
      this.consumoGasolina,
      this.tamanhoTanque});

  factory Carro.fromMap(Map<String, dynamic> json) => new Carro(
      id: json["id"],
      nome: json["nome"],
      consumoEtanol: json["consumoEtanol"],
      consumoGasolina: json["consumoGasolina"],
      tamanhoTanque: json["tamanhoTanque"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "consumoEtanol": consumoEtanol,
        "consumoGasolina": consumoGasolina,
        "tamanhoTanque": tamanhoTanque
      };
}
