import 'package:flutter/material.dart';

import '../rsc/text_style.dart';

class InputFieldContainer extends StatelessWidget {
  final Widget child;
  final String? nameTitle;
  final double size;
  final String? validateText;
  final bool? isHidden;

  const InputFieldContainer({
    Key? key,
    required this.child,
    this.nameTitle,
    required this.size,
    this.validateText,
    this.isHidden,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: Column(
        children: [
          SizedBox(
              width: size,
              child: Text(
                nameTitle ?? "",
                style: s15f700ColorBlueMa,
                textAlign: TextAlign.left,
              )),
          const SizedBox(
            height: 8,
          ),
          child,
          const SizedBox(
            height: 4,
          ),
          Visibility(
            visible: isHidden == null ? false : isHidden!,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/image/error_validate.png")),
                Text(
                  validateText ?? "",
                  style: s14f400ColorErrorPro,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
