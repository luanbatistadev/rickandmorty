import 'package:flutter/material.dart';
import 'package:rickandmorty/constansts/constants.dart';

class RMText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const RMText({
    Key? key,
    required this.text,
    this.fontSize = 18,
    this.color = kWhiteColor,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
