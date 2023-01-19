import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'note_item.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        const SizedBox(
          height: 60,
        ),
        const CustomAppBar(
          title: "Note",
          iconV: Icon(Icons.search, size: 32),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Custom_notes_item(),
                );
              }),
        )
      ]),
    );
  }
}
