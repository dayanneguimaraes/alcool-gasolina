import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:alcool_gasolina/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    initialRoute: "/",
    onGenerateRoute: RouteGeneretor.generateRoute,
  ));
}
