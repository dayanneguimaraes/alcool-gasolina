import 'package:alcool_gasolina/Menu.dart';
import 'package:alcool_gasolina/Home.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animationTranslate;
  // Animation animationSize;
  // Animation animationSizeBorder;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);

    // animationTranslate = Tween(begin: 0.0, end: 300.0)
    //     .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    // animationTranslate.addListener(() {
    //   setState(() {});
    // });

    // animationSize = Tween(begin: 1.0, end: 0.8)
    //     .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    // animationSize.addListener(() {
    //   setState(() {});
    // });

    // animationSizeBorder = Tween(begin: 0.0, end: 10.0)
    //     .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    // animationSizeBorder.addListener(() {
    //   setState(() {});
    // });
    animationTranslate = Tween(begin: 0.0, end: 300.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationTranslate.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _onTapMenu() {
    // print(controller);
    if (controller.value == 1) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Menu(),
        // Transform.scale(
        // scale: animationSize.value,
        Container(
            transform: Matrix4.identity()
              ..translate(animationTranslate.value, 0.0),
            // child:
            // ClipRRect(
            //     borderRadius: BorderRadius.circular(animationSizeBorder.value),
            child: Home(
              onTap: _onTapMenu,
            ))
        // ),
        // ) //tela inicial
      ],
    );
  }
}
