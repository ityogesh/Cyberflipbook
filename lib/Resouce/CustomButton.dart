import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.buttonName,
    this.onPressed,
  });
  final String buttonName;
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 150,
        child: RawMaterialButton(
          fillColor: Color.fromRGBO(53, 106, 255, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              buttonName,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  CustomButton2({
    this.buttonName,
    this.onPressed,
  });
  final String buttonName;
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width * 0.33,
      width: 150,
      height: 40,
      child: RawMaterialButton(
        fillColor: Color.fromRGBO(53, 106, 255, 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            buttonName,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
