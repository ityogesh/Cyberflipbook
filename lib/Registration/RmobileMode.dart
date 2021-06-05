import 'package:cyberflipbook/Registration/Registration.dart';
import 'package:flutter/material.dart';

class MobileMode extends StatefulWidget {
  final constraints;

  MobileMode(this.constraints);
  @override
  _MobileModeState createState() => _MobileModeState(constraints);
}

class _MobileModeState extends State<MobileMode> {
  final constraints;

  _MobileModeState(this.constraints);
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
            child: Registration(constraints),
          )
        ]),
      ),
    );
  }
}
