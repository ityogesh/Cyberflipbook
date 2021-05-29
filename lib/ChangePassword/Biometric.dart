import 'package:cyberflipbook/ForgoPassword/ForgotpassPage.dart';
import 'package:cyberflipbook/Resouce/CustomButton.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';
import 'package:flutter/material.dart';

class BiometricEnable extends StatefulWidget {
  @override
  _BiometricEnableState createState() => _BiometricEnableState();
}

class _BiometricEnableState extends State<BiometricEnable> {
  final _formKey = GlobalKey<FormState>();
  var service;

  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(217, 219, 224, 10),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              /*Padding(
                padding: const EdgeInsets.only(right: 320, bottom: 50),
                child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/logoQuestDark.png")),
              ),*/
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  MHConstants.forgotPassword,
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  MHConstants.newPassword,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Color.fromRGBO(53, 106, 255, 5), width: 2)),
                  child: Column(children: [
                    _icobutton(),
                    _biometircenabletext(),
                    _space(10),
                    _biometrictext(),
                    _space(10),
                    _biometricnote(),
                    _space(30),
                    _buttonChangePass()
                  ]),
                ),
              ),
            ]),
          ),
        ))));
  }

  _biometircenabletext() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Text(
        MHConstants.biometric,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  _biometrictext() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Text(
        MHConstants.biometrictext,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  _biometricnote() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 30),
      child: Text(
        MHConstants.note,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey,
        ),
      ),
    );
  }

  _buttonChangePass() {
    return Row(
      children: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Text(MHConstants.cancel),
          ),
          onTap: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotpasswordPage(),
                ));
          },
        ),
        _buttonChangePassword(),
      ],
    );
  }

  _icobutton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 300,
      ),
      child: IconButton(
        icon: Icon(
          Icons.cancel_rounded,
          color: Color.fromRGBO(53, 106, 255, 5),
        ),
        onPressed: () {
          Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => ForgotpasswordPage(),
              ));
        },
      ),
    );
  }

  _space(double space) {
    return SizedBox(height: space);
  }

  _buttonChangePassword() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: CustomButton2(
          buttonName: MHConstants.biometricbutton,
          onPressed: () {
            if (_formKey.currentState.validate()) return;
          }),
    );
  }
}
