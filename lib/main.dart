import 'package:alcool_gasolina/RouteGenerator.dart';
import 'package:alcool_gasolina/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    initialRoute: "/",
    onGenerateRoute: RouteGeneretor.generateRoute,
  ));
}
