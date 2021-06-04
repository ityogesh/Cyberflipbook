import 'package:cyberflipbook/Resouce/CustomButton.dart';
import 'package:cyberflipbook/Resouce/CustomTextfield.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';
import 'package:cyberflipbook/Resouce/motohubTextfieldType.dart';
import 'package:flutter/material.dart';
import '../LOGIN/login_page.dart';
import '../Validations.dart';
import 'SQPage.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String codeEmail;
  bool focuspannu = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/GCAlogo1.png")),
            ),
            Center(
              child: Text(
                MHConstants.forgotPassword,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Center(
                child: Text(
                  MHConstants.pleasEnterMailAddress,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomTextfield(
                placeHolder: MHConstants.email,
                validator: (String value) {
                  codeEmail = value;
                  return Validations.validateEmail(value);
                },
                keyboardtype: MotohubTextfieldType.email,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomButton(
                  buttonName: MHConstants.sendcode,
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    if (_formKey.currentState.validate())
                      return showDialog(
                        context: context,
                        builder: (context) => SQPage(),
                      );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Text(
                      MHConstants.forgottext,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      MHConstants.signin1,
                      style: TextStyle(color: Color.fromRGBO(46, 91, 255, 1)),
                    ),
                    onTap: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ]),
    ));
  }
}
