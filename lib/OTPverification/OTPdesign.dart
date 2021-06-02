import 'dart:io';
import 'package:cyberflipbook/ForgoPassword/ForgotpassPage.dart';
import 'package:cyberflipbook/Resouce/CustomButton.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class VerifyOTP extends StatefulWidget {
  VerifyOTP();

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  bool rememberMe = false;
  bool showTermsAndConditionError = false;
  final _formKey = GlobalKey<FormState>();
  var service;

  // List<BiometricType> _availableBiometrics;
  bool faceId = false;
  bool touchId = false;
  TextEditingController _textController;

  void initstate() {
    super.initState();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.3,
        horizontal: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 25,
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconbutton(),
                _twoFactorAuthenticationText(),
                _space(10),
                _otpBoxRow(),
                _space(10),
                _verifytext(),
                _space(20),
              ]),
        ),
      ),
    );
  }

  _twoFactorAuthenticationText() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        children: [
          Text(
            MHConstants.twoFactorAuth,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          _space(10),
          Text(
            MHConstants.enterVerificationCode,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  _otpBoxRow() {
    return Container(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _otpBox(),
          _otpBox(),
          _otpBox(),
          _otpBox(),
          _otpBox(),
          _otpBox()
        ],
      ),
    );
  }

  _otpBox() {
    //List<BiometricType> _availableBiometrics;
    return Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: Color.fromRGBO(53, 106, 255, 5), width: 1),
          color: Color.fromRGBO(220, 230, 255, 200),
        ),
        child: buildCodeNumberBox());
  }

  buildCodeNumberBox() {
    return TextField(
      controller: _textController,
      //autofillHints: [AutofillHints.oneTimeCode],
      textAlign: TextAlign.center,
      //textAlignVertical: TextAlignVertical.top,

      decoration: InputDecoration(
          hintText: "",
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
            bottom: 5, // HERE THE IMPORTANT PART
          ),
          counter: SizedBox.shrink()),
      // keyboardType: TextInputType.number,
      maxLength: 1,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        if (value.length == 0) {
          FocusScope.of(context).previousFocus();
        }
      },

      style: TextStyle(fontSize: 20),
    );
  }

  _verifytext() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          MHConstants.cancel,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        CustomButton(
          buttonName: "Submit",
          onPressed: () {},
        )
      ],
    );
  }

  _iconbutton() {
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
}
