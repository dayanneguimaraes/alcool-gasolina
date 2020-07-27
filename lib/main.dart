import 'package:alcool_gasolina/Home.dart';
import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:alcool_gasolina/Start.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Start(),
    initialRoute: "/",
    onGenerateRoute: RouteGeneretor.generateRoute,
  ));
}
