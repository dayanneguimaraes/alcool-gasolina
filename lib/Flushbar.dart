import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Flushbar flushbar;
void mensagemAlerta(String mensagem, BuildContext context) {
  flushbar = Flushbar(
    title: "Erro",
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Colors.red,
    boxShadows: [
      BoxShadow(
          color: Colors.red[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)
    ],
    backgroundGradient:
        LinearGradient(colors: [Colors.red[300], Colors.red[900]]),
    isDismissible: false,
    duration: Duration(seconds: 4),
    icon: Icon(
      Icons.error,
      color: Colors.redAccent[700],
    ),
    mainButton: FlatButton(
      onPressed: () {
        flushbar.dismiss();
      },
      child: Text(
        "SAIR",
        style: TextStyle(color: Colors.white),
      ),
    ),
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.blueGrey,
    titleText: Text(
      "Erro",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(
      mensagem,
      style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
  )..show(context);
}
