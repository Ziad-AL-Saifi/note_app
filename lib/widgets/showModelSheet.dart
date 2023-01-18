import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
      child: SingleChildScrollView(
        child: CustomForm(),
      ),
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  GlobalKey<FormState> custmKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? note;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: custmKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            hint: 'Title',
            minSize: 1,
            onSave: (p0) {
              title = p0;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: '- add your note ',
            minSize: 5,
            onSave: (p0) {
              note = p0;
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (custmKey.currentState!.validate()) {
                custmKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            child: Container(
              width: double.infinity,
              height: 60,
              child: Center(child: Text('Add')),
              decoration: BoxDecoration(
                  color: kColor, borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
