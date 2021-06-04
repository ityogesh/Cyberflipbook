import 'package:cyberflipbook/ForgoPassword/ForgotpassPage.dart';
import 'package:cyberflipbook/Resouce/Constants.dart';
import 'package:cyberflipbook/Resouce/CustomButton.dart';
import 'package:cyberflipbook/Resouce/CustomTextfield.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';
import 'package:cyberflipbook/Resouce/motohubTextfieldType.dart';
import 'package:flutter/material.dart';
import '../Validations.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword();

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
          const EdgeInsets.only(bottom: 170, top: 210, right: 15, left: 15),
      child: Card(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _icobutton(),
            _resetpasswordtext(),
            _space(),
            _customTextField(types: RegistrationFieldTypes.password),
            _customTextField(types: RegistrationFieldTypes.confirmPassword),
            _space(),
            _buttonChangePass(),
            _space()
          ]),
        ),
      ),
    );
  }

  _customTextField({RegistrationFieldTypes types}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextfield(
          placeHolder: placeHolderFor(types: types),
          validator: (String value) {
            switch (types) {
              case RegistrationFieldTypes.password:
                password = value;
                return Validations.validatePassword(value);
                break;
              case RegistrationFieldTypes.confirmPassword:
                confirmpassword = value;
                return Validations.validateConfirmPassword(value, password);
                break;
              default:
                return null;
                break;
            }
          },
          keyboardtype: _keyboardTypes(types: types)),
    );
  }

  String placeHolderFor({RegistrationFieldTypes types}) {
    switch (types) {
      case RegistrationFieldTypes.password:
        return MHConstants.newpassword;
      case RegistrationFieldTypes.confirmPassword:
        return MHConstants.confirmpassword;
      default:
        return null;
    }
  }

  _keyboardTypes({types: RegistrationFieldTypes}) {
    switch (types) {
      case RegistrationFieldTypes.password:
        return MotohubTextfieldType.password;
      case RegistrationFieldTypes.confirmPassword:
        return MotohubTextfieldType.confirmp;
      default:
        return null;
    }
  }

  _resetpasswordtext() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Text(
        MHConstants.resetpass,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  /*_passwordShouldContain() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        MHConstants.passwordShouldContain,
        style: TextStyle(fontSize: 12),
      ),
    );
  }*/

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

  _space() {
    return SizedBox(height: 10);
  }

  _buttonChangePassword() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: CustomButton2(
          buttonName: MHConstants.sendcode,
          onPressed: () {
            if (_formKey.currentState.validate()) return;
            /*{
              ApiCall.changePasswordApi(
                      email, resetcode, password, confirmpassword)
                  .then((value) {
                if (value.success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                } else {
                  CustomToast.showToast(value.message);
                }
              });*/
          }),
    );
  }
}
