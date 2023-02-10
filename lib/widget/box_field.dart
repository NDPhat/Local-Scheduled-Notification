import 'package:flutter/material.dart';

import '../rsc/color.dart';
import 'box_container.dart';

class BoxField extends StatelessWidget {
  String hintText;
  String nameTitle;
  double size;
  Icon icon;
  final VoidCallback onTapped;
  BoxField(
      {Key? key,
      required this.hintText,
      required this.nameTitle,
      required this.size,
      required this.icon,
      required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: BoxFieldContainer(
          size: size,
          nameTitle: nameTitle,
          child: TextField(
            readOnly: true,
            style: const TextStyle(color: colorGreyTetiary),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: colorSystemWhite)),
              fillColor: colorBGInput,
              border: InputBorder.none,
              suffixIcon: icon,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: colorMainBlue)),
              filled: true,
              hintText: hintText,
              contentPadding: const EdgeInsets.only(
                  bottom: 10.0, left: 10.0, right: 10.0, top: 10),
            ),
          )),
    );
  }
}
