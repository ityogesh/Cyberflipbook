import 'package:cyberflipbook/Registration/Registration.dart';
import 'package:flutter/material.dart';

class DesktopMode extends StatefulWidget {
  @override
  _DesktopModeState createState() => _DesktopModeState();
}

class _DesktopModeState extends State<DesktopMode> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;

    return Container(
        //width: double.infinity,
        child: Card(
            child: Row(children: [
      Padding(
        padding: const EdgeInsets.only(left: 80),
        child: Container(
          width: 400,
          child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                  child: Container(
                     // width: 100,
                      child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Registration(
                               )
                          ])),
                ),
              )),
        ),
      ),
      Expanded(
        flex:2,
        child: Padding(
          padding: const EdgeInsets.only(left: 100, right: 20),
          child: Container(
              
              height: MediaQuery.of(context).size.height *0.95,
              child: Image.asset(
                'assets/new_york_1.png',
                fit: BoxFit.fill,
              )),
        ),
      )
    ])));
  }
}
