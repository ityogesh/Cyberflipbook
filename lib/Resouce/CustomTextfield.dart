import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'motohubTextfieldType.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  final String placeHolder;
  final MotohubTextfieldType keyboardtype;
  final String Function(String) validator;
  var fillcolor;

  CustomTextfield({
    @required this.placeHolder,
    @required this.validator,
    @required this.keyboardtype,
    this.fillcolor,
  });
  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  final motohubController = TextEditingController();
  bool obscureText = true;

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    motohubController.addListener(_printEmailValue);
  }

  _printEmailValue() {
    widget.validator(motohubController.text);
  }

  void dispose() {
    super.dispose();
    motohubController.addListener(_printEmailValue);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(),
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            //width: 340,
            child: TextFormField(
              // showCursor: ,
              controller: motohubController,

              obscureText: widget.keyboardtype == MotohubTextfieldType.password
                  ? obscureText
                  : widget.keyboardtype == MotohubTextfieldType.confirmp
                      ? obscureText
                      : false,

              keyboardType: widget.keyboardtype == MotohubTextfieldType.email
                  ? TextInputType.emailAddress
                  : widget.keyboardtype == MotohubTextfieldType.password
                      ? TextInputType.text
                      : widget.keyboardtype == MotohubTextfieldType.firstName
                          ? TextInputType.name
                          : widget.keyboardtype == MotohubTextfieldType.phone
                              ? TextInputType.number
                              : widget.keyboardtype ==
                                      MotohubTextfieldType.confirmp
                                  ? TextInputType.text
                                  : widget.keyboardtype ==
                                          MotohubTextfieldType.question
                                      ? TextInputType.text
                                      : widget.keyboardtype ==
                                              MotohubTextfieldType.code
                                          ? TextInputType.number
                                          : TextInputType.text,
              validator: widget.validator,
              decoration: InputDecoration(
                //isDense: true,

                contentPadding: new EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                fillColor: Color.fromRGBO(224, 231, 255, 100),
                filled: true,
                labelText: widget.placeHolder,
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),

                suffixIcon: widget.keyboardtype == MotohubTextfieldType.password
                    ? TextButton(
                        child: Icon(
                          obscureText
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        onPressed: _toggle,
                      )
                    : widget.keyboardtype == MotohubTextfieldType.confirmp
                        ? TextButton(
                            child: Icon(
                              obscureText
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                              size: 18,
                            ),
                            onPressed: _toggle,
                          )
                        : null,
                //hintText: widget.placeHolder,
                //border: InputBorder.none
              ),
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class CustomTextfield1 extends StatefulWidget {
  final MotohubTextfieldType keyboardtype;
  final String Function(String) validator;
  var fillcolor;

  CustomTextfield1({
    @required this.validator,
    @required this.keyboardtype,
    this.fillcolor,
  });
  @override
  _CustomTextfield1State createState() => _CustomTextfield1State();
}

class _CustomTextfield1State extends State<CustomTextfield1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: TextFormField(
        keyboardType: widget.keyboardtype == MotohubTextfieldType.code
            ? TextInputType.number
            : TextInputType.number,
        decoration: InputDecoration(
          //isDense: true,
          contentPadding: new EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          fillColor: Color.fromRGBO(224, 231, 255, 100),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
