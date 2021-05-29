import 'package:flutter/material.dart';
import 'FdesktopMode.dart';
import 'FmobileMode.dart';

class ForgotpasswordPage extends StatefulWidget {
  @override
  _ForgotpasswordPageState createState() => _ForgotpasswordPageState();
}

class _ForgotpasswordPageState extends State<ForgotpasswordPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 1024) {
          return MobileMode();
        } else {
          return DesktopMode();
        }
      },
    );
  }
}
