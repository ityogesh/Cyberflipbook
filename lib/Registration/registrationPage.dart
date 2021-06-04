import 'package:flutter/material.dart';
import 'RdesktopMode.dart';
import 'RmobileMode.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 1024) {
          return MobileMode(constraints);
        } else {
          return DesktopMode(constraints);
        }
      },
    );
  }
}
