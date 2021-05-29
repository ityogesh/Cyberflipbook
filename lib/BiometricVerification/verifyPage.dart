import 'package:cyberflipbook/BiometricVerification/verifyDesktop.dart';
import 'package:cyberflipbook/BiometricVerification/verifyMobile.dart';
import 'package:flutter/material.dart';

class VerifyIdentityPage extends StatefulWidget {
  @override
  _VerifyIdentityPageState createState() => _VerifyIdentityPageState();
}

class _VerifyIdentityPageState extends State<VerifyIdentityPage> {
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
