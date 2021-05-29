import 'dart:io';

import 'package:cyberflipbook/ForgoPassword/ForgotpassPage.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'faceid.dart';
import 'fingerprintverify.dart';
import 'package:local_auth/local_auth.dart';

class VerifyIdentity extends StatefulWidget {
  VerifyIdentity(double d, double e, double f, double g, double h, double i,
      double j, double k, double l, double m, double n);

  @override
  _VerifyIdentityState createState() => _VerifyIdentityState();
}

class _VerifyIdentityState extends State<VerifyIdentity> {
  bool rememberMe = false;
  bool showTermsAndConditionError = false;
  final _formKey = GlobalKey<FormState>();
  var service;
  String email, resetcode, password, confirmpassword;
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  // List<BiometricType> _availableBiometrics;
  bool faceId = false;
  bool touchId = false;

  void initstate() {
    super.initState();
  }

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    // service = Provider.of<SignuploginValidation>(context);

    return Padding(
      padding:
          const EdgeInsets.only(top: 150, bottom: 190, right: 15, left: 15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 25,
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(children: [
              _icobutton(),
              _resetpasswordtext(),
              _space(10),
              _innerContainer(),
              _space(10),
              _verifytext(),
              _space(20)
            ]),
          ]),
        ),
      ),
    );
  }

  _resetpasswordtext() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Text(
        MHConstants.verifyIdentity,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  _innerContainer() {
    //List<BiometricType> _availableBiometrics;
    return Container(
        height: 150,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color.fromRGBO(53, 106, 255, 5), width: 1),
          color: Color.fromRGBO(220, 230, 255, 200),
        ),
        child: Card(
          color: Color.fromRGBO(220, 230, 255, 50),
          /*child: InkWell(
              child: Container(child: Text('$_availableBiometrics')),
              onTap: _getAvailableBiometrics,
            ),*/
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (_supportState == _SupportState.unknown)
                  CircularProgressIndicator(),
                if (_supportState == _SupportState.supported && touchId == true)
                  InkWell(
                    child: Image.asset(
                      'assets/fingerprint.png',
                      height: 70,
                      width: 70,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FingerPrintPage(),
                          ));
                    },
                  ),
                if (_supportState == _SupportState.supported && faceId)
                  InkWell(
                    child: Image.asset(
                      'assets/FACE ID.png',
                      height: 100,
                      width: 100,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FacePage(),
                          ));
                    },
                  )
              ],
            ),
          ),
        ));
  }

  _verifytext() {
    return Text(
      MHConstants.verifyText,
      style: TextStyle(color: Color.fromRGBO(145, 160, 180, 2)),
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

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> _availableBiometrics =
        await auth.getAvailableBiometrics();

    if (Platform.isIOS) {
      if (_availableBiometrics.contains(BiometricType.face)) {
        faceId = true;
      }
      // Face ID.
      if (_availableBiometrics.contains(BiometricType.fingerprint)) {
        touchId = true;
      }
      // Touch ID.

      /* setState(() {
        List<BiometricType> availableBiometrics;
        _availableBiometrics = availableBiometrics;
      });*/
    }
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
