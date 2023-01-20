import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Bloc/add_cubir/add_cubit.dart';

import '../Bloc/notes_cubit/notes_cubit.dart';
import '../constante.dart';
import '../for_color/color_item.dart';
import '../for_color/list_color_add.dart';
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
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: '- add your note ',
            minSize: 5,
            onSave: (p0) {
              note = p0;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListColorCircle(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddCubit, AddState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  if (custmKey.currentState!.validate()) {
                    custmKey.currentState!.save();
                    var noteModel = NoteModel(
                        title: title!,
                        note: note!,
                        time: DateTime.now().toString(),
                        color: BlocProvider.of<AddCubit>(context).cc);
                    BlocProvider.of<AddCubit>(context).addNote(noteModel);
                    BlocProvider.of<NotesCubit>(context).fetchNotes();
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
                  child: state is AddLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Center(child: Text('Add')),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
