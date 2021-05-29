import 'package:flutter/material.dart';
import 'FactorDesktop.dart';
import 'FactorMobile.dart';

class FactorPage extends StatefulWidget {
  @override
  _FactorPageState createState() => _FactorPageState();
}

class _FactorPageState extends State<FactorPage> {
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
