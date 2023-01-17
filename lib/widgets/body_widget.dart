import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'note_item.dart';

class bodyWidget extends StatelessWidget {
  const bodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        SizedBox(
          height: 60,
        ),
        CustomAppBar(),
        SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Custom_notes_item(),
                );
              }),
        )
      ]),
    );
  }
}
