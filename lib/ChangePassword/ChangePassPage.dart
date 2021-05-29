import 'package:flutter/material.dart';
import 'ChangePassDesk.dart';
import 'ChangePassMobile.dart';

class ChangePassPage extends StatefulWidget {
  @override
  _ChangePassPageState createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
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
