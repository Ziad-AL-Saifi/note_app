import 'package:flutter/material.dart';
import 'package:note/widgets/showModelSheet.dart';

class floatingActionButton extends StatelessWidget {
  const floatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) {
              return const CustomShowModelBottomSheet();
            });
      },
    );
  }
}
