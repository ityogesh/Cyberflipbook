import 'package:cyberflipbook/ForgoPassword/ForgotPassword.dart';
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
          width: 440,
          child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                    //width: 200,
                    child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      /*Image.asset('images/login-form.png',
                                              height: heightSize * 0.2,
                                              width: widthSize * 0.15),*/
                      SizedBox(height: 20),
                      ForgotPassword()
                    ])),
              )),
        ),
      ),
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 100, right: 20),
          child: Container(
              //width: 400,
              height: MediaQuery.of(context).size.height * 95,
              child: Image.asset(
                'assets/newyork2.jpeg',
                fit: BoxFit.fill,
              )),
        ),
      )
    ])));
  }
}
