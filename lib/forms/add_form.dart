import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Bloc/add_cubir/add_cubit.dart';

import '../constante.dart';
import '../model/note_models.dart';
import '../widgets/custom_text_field.dart';

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
                var p = custmKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: kColor, borderRadius: BorderRadius.circular(10)),
              child: const Center(child: Text('Add')),
            ),
          )
        ],
      ),
    );
  }
}
