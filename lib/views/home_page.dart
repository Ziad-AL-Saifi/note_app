import 'package:flutter/material.dart';
import 'package:note/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 60,
        ),
        CustomAppBar(),
      ]),
    );
  }
}
