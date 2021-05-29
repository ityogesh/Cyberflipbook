import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonSelecedAdimLep extends StatelessWidget {
  CustomButtonSelecedAdimLep({
    this.buttonName,
    this.onPressed,
    this.image,
    this.colorz,
    this.image1,
  });
  final String buttonName;
  final GestureTapCallback onPressed;
  var colorz;
  var image;
  var image1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          child: RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: colorz, width: 1),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(image),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    buttonName,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: Image.asset(
                    image1,
                    width: 15,
                    height: 15,
                  ),
                )
              ],
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
