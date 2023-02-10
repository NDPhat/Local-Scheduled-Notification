import 'package:flutter/material.dart';

import '../rsc/text_style.dart';

class BoxFieldContainer extends StatelessWidget {
  final Widget child;
  final String nameTitle;
  final double size;

  const BoxFieldContainer({
    Key? key,
    required this.child,
    required this.nameTitle,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Column(
        children: [
          SizedBox(
              width: size,
              child: Text(
                nameTitle,
                style: s15f700ColorBlueMa,
                textAlign: TextAlign.left,
              )),
          const SizedBox(
            height: 8,
          ),
          child,
        ],
      ),
    );
  }
}
