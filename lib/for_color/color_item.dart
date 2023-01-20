import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constante.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.index, required this.isClick});
  final int index;
  final bool isClick;

  @override
  Widget build(BuildContext context) {
    return isClick
        ? CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 34, backgroundColor: Color(c[index])))
        : CircleAvatar(radius: 34, backgroundColor: Color(c[index]));
  }
}
