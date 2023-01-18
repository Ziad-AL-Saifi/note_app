import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constante.dart';

OutlineInputBorder getColor(Color x) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: x),
    borderRadius: BorderRadius.circular(16),
  );
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.minSize = 1});
  final String hint;
  final int minSize;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
