import 'package:flutter/material.dart';
import 'SdeskTop.dart';
import 'Smobile.dart';

class SQPage extends StatefulWidget {
  @override
  _SQPageState createState() => _SQPageState();
}

class _SQPageState extends State<SQPage> {
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
