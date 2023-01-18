import 'package:flutter/material.dart';

import '../constante.dart';
import 'custom_text_field.dart';

class CustomShowModelBottomSheet extends StatelessWidget {
  const CustomShowModelBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: Column(
        children: [
          CustomTextField(hint: 'Title'),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: '- add your note ',
            minSize: 5,
          )
        ],
      ),
    );
  }
}
