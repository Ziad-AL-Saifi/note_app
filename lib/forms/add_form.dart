import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Bloc/add_cubir/add_cubit.dart';

import '../Bloc/notes_cubit/notes_cubit.dart';
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
          const ListColorCircle(),
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
                        color: Colors.blue.value);
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

class ListColorCircle extends StatefulWidget {
  const ListColorCircle({super.key});

  @override
  State<ListColorCircle> createState() => _ListColorCircleState();
}

class _ListColorCircleState extends State<ListColorCircle> {
  int isClick2 = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: c.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
                onTap: () {
                  isClick2 = index;
                  setState(() {});
                },
                child: ColorItem(
                  isClick: isClick2 == index,
                  index: index,
                )),
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.index, required this.isClick});
  final int index;
  final bool isClick;

  @override
  Widget build(BuildContext context) {
    return isClick
        ? CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 34, backgroundColor: Color(c[index])))
        : CircleAvatar(radius: 34, backgroundColor: Color(c[index]));
  }
}
