import 'package:cyberflipbook/ChangePassword/ChangePassPage.dart';
import 'package:cyberflipbook/ChangePassword/ChangePassword.dart';
import 'package:cyberflipbook/ChangePassword/FactorPage.dart';
import 'package:cyberflipbook/Resouce/Constants.dart';
import 'package:cyberflipbook/Resouce/CustomButton.dart';
import 'package:cyberflipbook/Resouce/CustomTextfield.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';
import 'package:cyberflipbook/Resouce/motohubTextfieldType.dart';
import 'package:flutter/material.dart';
import '../Validations.dart';
import 'ForgotpassPage.dart';

class SecurityQuestion extends StatefulWidget {
  SecurityQuestion(double d, double e, double f, double g, double h, double i,
      double j, double k, double l, double m, double n);

  @override
  _SecurityQuestionState createState() => _SecurityQuestionState();
}

class _SecurityQuestionState extends State<SecurityQuestion> {
  String question1, question2, question3;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 80, top: 150, right: 15, left: 15),
        child: Card(
          shadowColor: Colors.black,
          elevation: 25,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Column(
                children: [
                  _icobutton(),
                  _securityText(),
                  _customTextField(types: RegistrationFieldTypes.question1),
                  _space(30),
                  _customTextField(types: RegistrationFieldTypes.question2),
                  _space(30),
                  _customTextField(types: RegistrationFieldTypes.question3),
                  _space(30),
                  _attempT(),
                  _space(10),
                  _buttonSecurityQuestioN(),
                  _space(20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _customTextField({RegistrationFieldTypes types}) {
    return Padding(
        padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
        child: CustomTextfield(
            placeHolder: placeHolderFor(types: types),
            // ignore: missing_return
            validator: (String value) {
              switch (types) {
                case RegistrationFieldTypes.question1:
                  question1 = value;
                  return Validations.validateQuestion(value);
                  break;
                case RegistrationFieldTypes.question2:
                  question2 = value;
                  return Validations.validateQuestion(value);
                  break;
                case RegistrationFieldTypes.question3:
                  question3 = value;
                  return Validations.validateQuestion(value);
                  break;
                default:
                  break;
              }
            },
            keyboardtype: _keyboardTypes(types: types)));
  }

  String placeHolderFor({RegistrationFieldTypes types}) {
    switch (types) {
      case RegistrationFieldTypes.question1:
        return MHConstants.question1;
      case RegistrationFieldTypes.question2:
        return MHConstants.question2;
      case RegistrationFieldTypes.question3:
        return MHConstants.question3;
      default:
        return null;
    }
  }

  _space(double space) {
    return SizedBox(height: space);
  }

  _keyboardTypes({types: RegistrationFieldTypes}) {
    switch (types) {
      case RegistrationFieldTypes.question1:
        return MotohubTextfieldType.question;
      case RegistrationFieldTypes.question2:
        return MotohubTextfieldType.question;
      case RegistrationFieldTypes.question3:
        return MotohubTextfieldType.question;
      default:
        return null;
    }
  }

  _securityText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        MHConstants.securityQuestion1,
        style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none),
      ),
    );
  }

  _icobutton() {
    return Padding(
      padding: const EdgeInsets.only(left: 300, top: 10),
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

  _buttonSecurityQuestioN() {
    return Center(
      child: Row(
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Text(MHConstants.cancel),
            ),
            onTap: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotpasswordPage(),
                  ));
            },
          ),
          _buttonSecurityQuestion(),
        ],
      ),
    );
  }

  _attempT() {
    return Padding(
      padding: const EdgeInsets.only(right: 220, top: 10),
      child: Text(MHConstants.attempt),
    );
  }

  _buttonSecurityQuestion() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: CustomButton2(
          buttonName: MHConstants.sendcode,
          onPressed: () {
            FocusScope.of(context).unfocus();
            if (_formKey.currentState.validate()) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => ChangePassPage(),
              );
            }
          }),
    );
  }
}
