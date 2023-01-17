import 'package:flutter/material.dart';
import 'package:note/widgets/custom_appbar.dart';

import '../widgets/body_widget.dart';
import '../widgets/floatingAction.dart';
import '../widgets/note_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget(),
      floatingActionButton: floatingActionButton(),
    );
  }
}
