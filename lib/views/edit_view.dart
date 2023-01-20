// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Bloc/notes_cubit/notes_cubit.dart';

import 'package:note/model/note_models.dart';
import 'package:note/widgets/custom_appbar.dart';
import 'package:note/widgets/custom_text_field.dart';

class EditView extends StatefulWidget {
  EditView({
    Key? key,
    required this.note,
  }) : super(key: key);
  NoteModel? note;
  String? newTitle, newNote;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          const SizedBox(height: 60),
          CustomAppBar(
              onTap: () {
                widget.note!.title = widget.newTitle ?? widget.note!.title;
                widget.note!.note = widget.newNote ?? widget.note!.note;
                widget.note!.save();
                BlocProvider.of<NotesCubit>(context).fetchNotes();
                Navigator.pop(context);
              },
              title: 'Edit',
              iconV: const Icon(Icons.check, size: 32)),
          const SizedBox(height: 15),
          CustomTextField(
            hint: widget.note!.title,
            minSize: 1,
            onChanged: (p0) {
              widget.newTitle = p0;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: widget.note!.note,
            minSize: 5,
            onChanged: (p0) {
              widget.newNote = p0;
            },
          ),
        ]),
      ),
    );
  }
}
