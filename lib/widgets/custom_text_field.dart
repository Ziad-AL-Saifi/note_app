// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constante.dart';

OutlineInputBorder getColor(Color x) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: x),
    borderRadius: BorderRadius.circular(10),
  );
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.minSize,
    this.onSave,
  }) : super(key: key);
  final String hint;
  final int minSize;
  final Function(String?)? onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'you need to full that';
        }
      },
      onSaved: onSave,
      cursorColor: kColor,
      maxLines: minSize,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: kColor),
          focusedBorder: getColor(kColor),
          enabledBorder: getColor(Colors.white),
          border: getColor(kColor)),
    );
  }
}
