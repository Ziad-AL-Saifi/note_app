import 'package:flutter/material.dart';
import 'package:note/widgets/custom_appbar.dart';

import '../widgets/note_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          SizedBox(
            height: 60,
          ),
          CustomAppBar(),
          SizedBox(height: 15),
          Custom_notes_item(),
        ]),
      ),
    );
  }
}
