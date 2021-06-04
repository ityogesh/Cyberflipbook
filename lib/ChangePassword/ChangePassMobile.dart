import 'package:cyberflipbook/ChangePassword/ChangePassword.dart';
import 'package:flutter/material.dart';

class MobileMode extends StatefulWidget {
  @override
  _MobileModeState createState() => _MobileModeState();
}

class _MobileModeState extends State<MobileMode> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    //final double heightSize = MediaQuery.of(context).size.height;

    return Center(
      child: Container(child: Column(children: [ChangePassword()])),
    );
  }
}
