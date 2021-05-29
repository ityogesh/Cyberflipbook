import 'dart:async';
import 'dart:io';

import 'package:cyberflipbook/HOME/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

/*void main() {
  runApp(MyApp());
}*/

class FingerPrintPage extends StatefulWidget {
  @override
  _FingerPrintPageState createState() => _FingerPrintPageState();
}

class _FingerPrintPageState extends State<FingerPrintPage> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  /*void initState1() {
    super.initState();
    auth.isDeviceSupported().then(
          (notSupported) => setState(() => _supportState =
              notSupported ? _SupportState.unsupported : _SupportState.unknown),
        );
  }*/

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  /*Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) return;*/

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*if (_supportState == _SupportState.unknown)
              CircularProgressIndicator()
            else if (_supportState == _SupportState.supported)
              Text("This device is supported")
            else
              Text("This device is not supported"),
            Divider(height: 100),
            Text('Can check biometrics: $_canCheckBiometrics\n'),
            ElevatedButton(
              child: const Text('Check biometrics'),
              onPressed: _checkBiometrics,
            ),*/
            //Divider(height: 100),

            Divider(height: 100),
            Text('Current State: $_authorized\n'),
            (_isAuthenticating)
                ? ElevatedButton(
                    onPressed: _cancelAuthentication,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Cancel Authentication"),
                        Icon(Icons.cancel),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      ElevatedButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Authenticate'),
                            Icon(Icons.perm_device_information),
                          ],
                        ),
                        onPressed: _authenticate,
                      ),
                      ElevatedButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(_isAuthenticating
                                ? 'Cancel'
                                : 'Authenticate: biometrics only'),
                            Icon(Icons.fingerprint),
                          ],
                        ),
                        onPressed: _authenticateWithBiometrics,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
