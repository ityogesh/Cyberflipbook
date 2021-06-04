import 'package:cyberflipbook/ChangePassword/ChangePassword.dart';
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
          // width: 450,
          child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                    child: Column(children: [
                  SizedBox(height: 20),
                  Container(
                    width: 450,
                    //height: 500,
                    child: ChangePassword(),
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
