import 'package:flutter/material.dart';

import '../rsc/color.dart';
import 'input_field_container.dart';

class InputField extends StatelessWidget {
  String hintText;
  String nameTitle;
  double size;
  String? validateText;
  bool? isHidden;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? hasError;
  bool? readOnly;

  String? dataController;
  InputField({
    Key? key,
    this.readOnly,
    required this.hintText,
    required this.nameTitle,
    required this.size,
    this.validateText,
    this.isHidden,
    this.hasError,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputFieldContainer(
        size: size,
        nameTitle: nameTitle,
        validateText: validateText == null ? '' : validateText!,
        isHidden: isHidden == null ? false : isHidden!,
        child: TextField(
          readOnly: readOnly != null ? false :true,
          textInputAction: TextInputAction.next,
          controller: controller != null ? controller : null,
          style: const TextStyle(color: colorGreyTetiary),
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: hasError == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: colorErrorPrimary))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: colorSystemWhite)),
            fillColor: colorBGInput,
            border: InputBorder.none,
            focusedBorder: hasError == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: colorErrorPrimary))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: colorMainBlue)),
            filled: true,
            hintText: hintText,
            contentPadding: const EdgeInsets.only(
                bottom: 10.0, left: 10.0, right: 10.0, top: 10),
          ),
          onChanged: onChanged,
        ));
  }
}
