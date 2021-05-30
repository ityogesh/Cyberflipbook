import 'package:cyberflipbook/LOGIN/login_page.dart';
import 'package:cyberflipbook/Resouce/Constants.dart';
import 'package:cyberflipbook/Resouce/CustomButton.dart';
import 'package:cyberflipbook/Resouce/CustomButton1.dart';
import 'package:cyberflipbook/Resouce/CustomTextfield.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';
import 'package:cyberflipbook/Resouce/motohubTextfieldType.dart';
import 'package:flutter/material.dart';
import '../Validations.dart';

class Registration extends StatefulWidget {
  

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool rememberMe = false;
  bool showTermsAndConditionError = false;
  bool isSelectedadmin = true;
  var service;
  final _formKey = GlobalKey<FormState>();
  String email,
      firstname,
      lastname,
      phone,
      password,
      confirmpassword,
      _dropdown1,
      _dropdown,
      question1,
      question2,
      question3;
  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          // height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                    child: Center(
                        child: Image.asset(
                  "assets/GCAlogo1.png",
                  width: 80,
                ))),
              ),
              _space(20),
              _text(),
              _space(10),
              _customTextField(types: RegistrationFieldTypes.firstName),
              _space(20),
              _customTextField(types: RegistrationFieldTypes.lastName),
              _space(20),
              _customTextField(types: RegistrationFieldTypes.phone),
              _space(20),
              _customTextField(types: RegistrationFieldTypes.email),
              _space(20),
              _countrySelection(),
              _space(20),
              _customTextField(types: RegistrationFieldTypes.password),
              _space(20),
              _customTextField(types: RegistrationFieldTypes.confirmPassword),
              _space(20),
              _adminLepSelection(),
              _space(20),
              _securityques(),
              _space(20),
              _customTextField(types: RegistrationFieldTypes.question1),
              _space(20),
              _customTextField(types: RegistrationFieldTypes.question2),
              _space(20),
              _customTextField(types: RegistrationFieldTypes.question3),
              _space(20),
              _buttonRegistration(),
              _space(20),
              _signin(),
              _space(30)
            ]),
          ),
        ),
      ),
    ));
  }

  _customTextField({RegistrationFieldTypes types}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: CustomTextfield(
          placeHolder: placeHolderFor(types: types),
          // ignore: missing_return
          validator: (String value) {
            switch (types) {
              case RegistrationFieldTypes.email:
                email = value;
                return Validations.validateEmail(value);
                break;
              case RegistrationFieldTypes.firstName:
                firstname = value;
                return Validations.validateFirstName(value);
                break;
              case RegistrationFieldTypes.lastName:
                lastname = value;
                return Validations.validateLastName(value);
                break;
              case RegistrationFieldTypes.phone:
                phone = value;
                return Validations.validatePhone(value);
              case RegistrationFieldTypes.password:
                password = value;
                return Validations.validatePassword(value);
                break;
              case RegistrationFieldTypes.confirmPassword:
                confirmpassword = value;
                return Validations.validateConfirmPassword(value, password);
                break;
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
          keyboardtype: _keyboardTypes(types: types)),
    );
  }

  String placeHolderFor({RegistrationFieldTypes types}) {
    switch (types) {
      case RegistrationFieldTypes.firstName:
        return MHConstants.firstname;
      case RegistrationFieldTypes.lastName:
        return MHConstants.lastname;
      case RegistrationFieldTypes.phone:
        return MHConstants.phone;
      case RegistrationFieldTypes.email:
        return MHConstants.email;
      case RegistrationFieldTypes.password:
        return MHConstants.password;
      case RegistrationFieldTypes.confirmPassword:
        return MHConstants.confirmpassword;
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

  _keyboardTypes({types: RegistrationFieldTypes}) {
    switch (types) {
      case RegistrationFieldTypes.firstName:
        return MotohubTextfieldType.firstName;
      case RegistrationFieldTypes.lastName:
        return MotohubTextfieldType.firstName;
      case RegistrationFieldTypes.phone:
        return MotohubTextfieldType.phone;
      case RegistrationFieldTypes.email:
        return MotohubTextfieldType.email;
      case RegistrationFieldTypes.password:
        return MotohubTextfieldType.password;
      case RegistrationFieldTypes.confirmPassword:
        return MotohubTextfieldType.confirmp;
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

  _space(double space) {
    return SizedBox(height: space);
  }

  _text() {
    return Text(MHConstants.securesignup, style: TextStyle(fontSize: 25));
  }

  _countrySelection() {
    return Row(
      children: [_countrySelect(), _jurisdictionSelect1()],
    );
  }

  _countrySelect() {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Container(
        height: 45,
        width: 210,
        //width: MediaQuery.of(context).size.width * 0.53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
          color: Color.fromRGBO(224, 231, 255, 100),
        ),
        child: new DropdownButton<String>(
          isDense: true,
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'COUNTRY',
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
          value: _dropdown,
          onChanged: (String map) {
            setState(() {
              _dropdown = map;
            });
          },
          items: getDrops.map((Map map) {
            return new DropdownMenuItem<String>(
              value: map['name'].toString(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Image.asset(
                      map['image'],
                      height: 40,
                      width: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: new Text(map['name']),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  _jurisdictionSelect1() {
    //final data = MediaQuery.of(context);
    return Container(
      height: 45,
      width: 145,
      //width: MediaQuery.of(context).size.width * 0.34,
      //width: data.size.width / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
        color: Color.fromRGBO(224, 231, 255, 100),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: new DropdownButton(
          isDense: true,
          //isExpanded: true,
          hint: _dropdown1 == null
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    'JURISDICTION',
                    style: TextStyle(fontSize: 10),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Text(
                    _dropdown1,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
          items: getJuris.map((Juris lang) {
            return new DropdownMenuItem<String>(
                value: lang.type, child: new Text(lang.type));
          }).toList(),
          onChanged: (val) {
            setState(() {
              _dropdown1 = val;
            });
            print(val);
          },
        ),
      ),
    );
  }

  _signin() {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 80,
            ),
            child: Text(
              MHConstants.signin,
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
    );
  }

  _adminLepSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _adminlepButton(types: AdminLepButtonTypes.lep),
        _space(30),
        _adminlepButton(types: AdminLepButtonTypes.admin),
        _space(30),
      ],
    );
  }

  _securityques() {
    return Padding(
      padding: const EdgeInsets.only(right: 200),
      child: Text(
        MHConstants.securityQuestion,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }

  _adminlepButton({AdminLepButtonTypes types}) {
    var buttonName = types == AdminLepButtonTypes.lep
        ? MHConstants.lep
        : types == AdminLepButtonTypes.admin
            ? MHConstants.admin
            : null;
    var image = types == AdminLepButtonTypes.lep
        ? 'assets/IconPolice.png'
        : types == AdminLepButtonTypes.admin
            ? 'assets/admin.png'
            : null;
    var image1 = types == AdminLepButtonTypes.admin
        ? isSelectedadmin
            ? 'assets/Checked Icon2.png'
            : 'assets/Checked Icon.png'
        : types == AdminLepButtonTypes.lep
            ? isSelectedadmin
                ? 'assets/Checked Icon.png'
                : 'assets/Checked Icon2.png'
            : null;
    var colorz = types == AdminLepButtonTypes.lep
        ? isSelectedadmin
            ? Colors.blue
            : Colors.grey
        : types == AdminLepButtonTypes.admin
            ? isSelectedadmin
                ? Colors.grey
                : Colors.blue
            : null;
    return CustomButtonSelecedAdimLep(
      colorz: colorz,
      image: image,
      image1: image1,
      buttonName: buttonName,
      onPressed: () {
        FocusScope.of(context).unfocus();
        switch (types) {
          case AdminLepButtonTypes.admin:
            if (isSelectedadmin) {
              setState(() {
                isSelectedadmin = !isSelectedadmin;
              });
            }
            break;
          case AdminLepButtonTypes.lep:
            setState(() {
              //isSelectedlep = !isSelectedlep;
              if (isSelectedadmin == false) {
                setState(() {
                  isSelectedadmin = !isSelectedadmin;
                });
              }
            });
        }
      },
    );
  }

  _buttonRegistration() {
    return CustomButton(
        buttonName: MHConstants.register,
        onPressed: () {
          if (_formKey.currentState.validate()) return null;
        });
  }
}
