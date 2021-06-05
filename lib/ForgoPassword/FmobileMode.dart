import 'package:cyberflipbook/ForgoPassword/ForgotPassword.dart';
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
      SingleChildScrollView(child: ForgotPassword())
    ]))));
  }
}
