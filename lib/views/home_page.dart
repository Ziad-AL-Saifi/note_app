import 'package:flutter/material.dart';

import '../widgets/body_widget.dart';
import '../widgets/floatingAction.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyWidget(),
      floatingActionButton: floatingActionButton(),
    );
  }
}
