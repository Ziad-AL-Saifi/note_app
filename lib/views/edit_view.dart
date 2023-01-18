import 'package:flutter/material.dart';
import 'package:note/widgets/custom_appbar.dart';
import 'package:note/widgets/custom_text_field.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          SizedBox(
            height: 60,
          ),
          CustomAppBar(title: 'Edit', iconV: Icon(Icons.check, size: 32)),
          SizedBox(height: 15),
          CustomTextField(hint: "Title"),
          SizedBox(height: 16),
          CustomTextField(hint: 'edit', minSize: 5),
        ]),
      ),
    );
  }
}
