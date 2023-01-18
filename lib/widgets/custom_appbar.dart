import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.iconV});
  final String title;
  final Widget iconV;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30),
        ),
        Spacer(),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.08),
              borderRadius: BorderRadius.circular(16)),
          child: IconButton(
            icon: iconV,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
