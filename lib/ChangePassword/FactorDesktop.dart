import 'package:cyberflipbook/ChangePassword/FactorVerification.dart';
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

    return Center(
      child: Row(children: [
        Container(
          // width: 440,
          child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                    child: Column(children: [
                  SizedBox(height: 20),
                  Container(
                    width: 400,
                    child: FactorVerification(
                        0.009,
                        0.04,
                        widthSize * 0.02,
                        0.06,
                        0.04,
                        0.07,
                        widthSize * 0.09,
                        0.05,
                        0.032,
                        0.04,
                        0.030),
                  )
                ])),
              )),
        ),
        /* Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 20),
        child: Container(
            //width: 400,
            height: MediaQuery.of(context).size.height * 95,
            child: Image.asset(
              'assets/newyork2.png',
              fit: BoxFit.fill,
            )),
      ),
        )*/
      ]),
    );
  }
}
