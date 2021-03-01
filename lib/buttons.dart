import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  //? Buttons Variables
  final color;
  final textColor;
  final String btnText;
  final btnTap;

//? Initialise the widget
  const MyButton({
    @required this.color,
    @required this.textColor,
    @required this.btnText,
    @required this.btnTap,
  });
  //? Suppose to place assert for debugging.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                btnText,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
