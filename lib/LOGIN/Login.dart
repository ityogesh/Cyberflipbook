import 'package:cyberflipbook/Registration/registrationPage.dart';
import 'package:cyberflipbook/Resouce/Constants.dart';
import 'package:cyberflipbook/Resouce/CustomButton.dart';
import 'package:cyberflipbook/Resouce/CustomButton1.dart';
import 'package:cyberflipbook/Resouce/CustomTextfield.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';
import 'package:cyberflipbook/Resouce/motohubTextfieldType.dart';
import 'package:flutter/material.dart';
import '../Validations.dart';

class Login extends StatefulWidget {
  /*Login(double d, double e, double f, double g, double h, double i, double j,
      double l, double m, double n);*/

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSelectedadmin = true;

  final _formKey = GlobalKey<FormState>();

  String email, password;
  var service;

  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final double widthSize = MediaQuery.of(context).size.width;
    //final double heightSize = MediaQuery.of(context).size.height;
    //service = Provider.of<SignuploginValidation>(context);
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Container(
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _space(30),
            _image(),
            Center(
              child: Container(
                child: Image.asset(
                  'assets/GCAlogo1.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            _space(20),
            _text(),
            _space(10),
            _text2(),
            _space(30),
            _customTextField(isEmail: true),
            _space(20),
            _customTextField(isEmail: false),
            _space(30),
            _forgotpass(),
            _space(20),
            _adminlepSelection(),
            _space(20),
            _buttonsInLoginPage(types: LoginButtonTypes.login),
            _space(20),
            _signup(),
          ]),
        ),
      ),
    ));
  }

  _customTextField({bool isEmail}) {
    return CustomTextfield(
      fillcolor: Colors.red[100],
      placeHolder: isEmail ? MHConstants.email : MHConstants.password,
      validator: (String value) {
        if (isEmail) {
          email = value;
          return Validations.validateEmail(value);
        } else {
          password = value;
          return Validations.validatePassword(value);
        }
      },
      keyboardtype:
          isEmail ? MotohubTextfieldType.email : MotohubTextfieldType.password,
    );
  }

  _adminlepSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _adminlepButton(types: AdminLepButtonTypes.lep),
        _space(30),
        _adminlepButton(types: AdminLepButtonTypes.admin),
        _space(30),
      ],
    );
  }

  _space(double space) {
    return SizedBox(height: space);
  }

  _text() {
    return Center(
        child: Text(MHConstants.securelogin, style: TextStyle(fontSize: 25)));
  }

  _text2() {
    return Center(
        child: InkWell(
            child: Text(
              MHConstants.logintext,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {},
              );
            }));
  }

  _signup() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(
            MHConstants.signup,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        InkWell(
          child: Text(
            MHConstants.signup1,
            style: TextStyle(color: Color.fromRGBO(46, 91, 255, 1)),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegistrationPage(),
                ));
          },
        ),
      ],
    );
  }

  _image() {
    return Container(
      height: 30,
      width: 180,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/united-states-emoji1.png'),
          Image.asset(
            'assets/canada-emoji.png',
            height: 50,
            width: 25,
          ),
          Image.asset(
            'assets/european-union-emoji.png',
            height: 50,
            width: 25,
          ),
        ],
      ),
    );
  }

  _forgotpass() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          MHConstants.forgot,
          style: TextStyle(color: Colors.grey),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context){},
            ));
      },
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
            ? 'assets/blank.png'
            : 'assets/Checked Icon.png'
        : types == AdminLepButtonTypes.lep
            ? isSelectedadmin
                ? 'assets/Checked Icon.png'
                : 'assets/blank.png'
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

  _buttonsInLoginPage({LoginButtonTypes types}) {
    var buttonName = types == LoginButtonTypes.login ? MHConstants.login : null;

    return CustomButton(
        buttonName: buttonName,
        width: MediaQuery.of(context).size.width,
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (_formKey.currentState.validate())
            showDialog(
              context: context,
              builder: (context){},
            );
        });
  }
}
