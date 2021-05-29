import 'package:cyberflipbook/LOGIN/Login.dart';
import 'package:flutter/material.dart';

class MobileMode extends StatefulWidget {
  @override
  _MobileModeState createState() => _MobileModeState();
}

class _MobileModeState extends State<MobileMode> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
            child: Container(
                /*decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Color.fromRGBO(66, 105, 255, 1),
                      Color.fromRGBO(66, 205, 255, 1)
                    ])),*/
                child: Column(children: [
      /*Image.asset('assets/GCAlogo1.png',
          height: heightSize * 0.2, width: widthSize * 0.4),*/
      SingleChildScrollView(
          child: Login(
              /*  0.009,
        0.04,
        widthSize * 0.04,
        0.06,
        0.04,
        0.07,
        widthSize * 0.09,
        0.05,
        0.032,
        0.04,*/
              ))
    ]))));
  }
}
