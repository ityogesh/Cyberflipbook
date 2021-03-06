import 'package:cyberflipbook/Registration/Registration.dart';
import 'package:flutter/material.dart';

class DesktopMode extends StatefulWidget {
  final constraints;

  DesktopMode(this.constraints);

  @override
  _DesktopModeState createState() => _DesktopModeState(constraints);
}

class _DesktopModeState extends State<DesktopMode> {
  final constraints;

  _DesktopModeState(this.constraints);
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
                        Registration(constraints)
                      ])),
                ),
              )),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 100, right: 20),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.95,
              child: Image.asset(
                'assets/newyork2.jpeg',
                fit: BoxFit.fill,
              )),
        ),
      )
    ])));
  }
}
