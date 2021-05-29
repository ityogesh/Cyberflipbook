import 'package:cyberflipbook/ChangePassword/ChangePassPage.dart';
import 'package:cyberflipbook/ForgoPassword/ForgotpassPage.dart';
import 'package:cyberflipbook/Resouce/Constants.dart';
import 'package:cyberflipbook/Resouce/CustomButton.dart';
import 'package:cyberflipbook/Resouce/CustomTextfield.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';
import 'package:cyberflipbook/Resouce/motohubTextfieldType.dart';
import 'package:flutter/material.dart';
import '../Validations.dart';
import 'ChangePassword.dart';

class FactorVerification extends StatefulWidget {
  FactorVerification(double d, double e, double f, double g, double h, double i,
      double j, double k, double l, double m, double n);

  @override
  _FactorVerificationState createState() => _FactorVerificationState();
}

class _FactorVerificationState extends State<FactorVerification> {
  bool rememberMe = false;
  bool showTermsAndConditionError = false;
  final _formKey = GlobalKey<FormState>();
  var service;
  String email, resetcode, password, confirmpassword;

  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // service = Provider.of<SignuploginValidation>(context);

    return Padding(
      padding:
          const EdgeInsets.only(top: 230, bottom: 260, right: 15, left: 15),
      child: Card(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(children: [
              _icobutton(),
              _factorVerifytext(),
              _space(10),
              _factorVerificationtext(),
              _space(10),
              _customTextField(types: RegistrationFieldTypes.resetCode),
              _space(30),
              _buttonChangePass(),
              _space(20)
            ]),
          ]),
        ),
      ),
    );
  }

  _customTextField({RegistrationFieldTypes types}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 4),
          child: CustomTextfield1(
              validator: (String value) {
                switch (types) {
                  case RegistrationFieldTypes.resetCode:
                    password = value;
                    return Validations.validatePassword(value);
                    break;
                  default:
                    return null;
                    break;
                }
              },
              keyboardtype: _keyboardTypes(types: types)),
        ),
        CustomTextfield1(
            validator: (String value) {
              switch (types) {
                case RegistrationFieldTypes.resetCode:
                  password = value;
                  return Validations.validatePassword(value);
                  break;
                default:
                  return null;
                  break;
              }
            },
            keyboardtype: _keyboardTypes(types: types)),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: CustomTextfield1(
              validator: (String value) {
                switch (types) {
                  case RegistrationFieldTypes.resetCode:
                    password = value;
                    return Validations.validatePassword(value);
                    break;
                  default:
                    return null;
                    break;
                }
              },
              keyboardtype: _keyboardTypes(types: types)),
        ),
        CustomTextfield1(
            validator: (String value) {
              switch (types) {
                case RegistrationFieldTypes.resetCode:
                  password = value;
                  return Validations.validatePassword(value);
                  break;
                default:
                  return null;
                  break;
              }
            },
            keyboardtype: _keyboardTypes(types: types)),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: CustomTextfield1(
              validator: (String value) {
                switch (types) {
                  case RegistrationFieldTypes.resetCode:
                    password = value;
                    return Validations.validatePassword(value);
                    break;
                  default:
                    return null;
                    break;
                }
              },
              keyboardtype: _keyboardTypes(types: types)),
        ),
        CustomTextfield1(
            validator: (String value) {
              switch (types) {
                case RegistrationFieldTypes.resetCode:
                  password = value;
                  return Validations.validatePassword(value);
                  break;
                default:
                  return null;
                  break;
              }
            },
            keyboardtype: _keyboardTypes(types: types)),
      ],
    );
  }

  _keyboardTypes({types: RegistrationFieldTypes}) {
    switch (types) {
      case RegistrationFieldTypes.resetCode:
        return MotohubTextfieldType.code;
      default:
        return null;
    }
  }

  _factorVerifytext() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Text(
        MHConstants.factorverify,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  _factorVerificationtext() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Text(
        MHConstants.factorcode,
        style: TextStyle(
          fontSize: 11,
          color: Colors.grey,
        ),
      ),
    );
  }

  _buttonChangePass() {
    return Row(
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
        _buttonChangePassword(),
      ],
    );
  }

  _icobutton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 300,
      ),
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

  _space(double space) {
    return SizedBox(height: space);
  }

  _buttonChangePassword() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: CustomButton2(
          buttonName: MHConstants.sendcode,
          onPressed: () {
            if (_formKey.currentState.validate())
              return showDialog(
                context: context,
                builder: (context) => ChangePassPage(),
              );
          }),
    );
  }
}
