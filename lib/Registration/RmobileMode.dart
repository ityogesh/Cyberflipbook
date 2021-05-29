import 'package:cyberflipbook/Registration/Registration.dart';
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
      body: SingleChildScrollView(
        child: Column(children: [
          /*Image.asset('assets/GCAlogo1.png',
          height: heightSize * 0.2, width: widthSize * 0.4),*/
          SingleChildScrollView(
            child: Registration(0.009, 0.04, widthSize * 0.04, 0.06, 0.04, 0.07,
                widthSize * 0.09, 0.05, 0.032, 0.04, 0.032),
          )
        ]),
      ),
    );
  }
}