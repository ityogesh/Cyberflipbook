import 'package:cyberflipbook/LOGIN/login_page.dart';
import 'package:flutter/material.dart';
//import 'LOGIN/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
