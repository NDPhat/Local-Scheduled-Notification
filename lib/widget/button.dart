import 'package:flutter/material.dart';

import '../rsc/color.dart';
import '../rsc/text_style.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double size;
  final Color color, textColor;
  RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: press,
          child: Text(
            text,
            style:
                TextStyle(color: textColor, fontWeight: font700, fontSize: 16),
          )),
    );
  }
}
