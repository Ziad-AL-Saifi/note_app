import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Bloc/add_cubir/add_cubit.dart';
import 'package:note/Bloc/notes_cubit/notes_cubit.dart';
import 'package:note/model/note_models.dart';

import 'custom_appbar.dart';
import 'note_item.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        BlocProvider.of<NotesCubit>(context).fetchNotes();
        List<NoteModel> data = BlocProvider.of<NotesCubit>(context).notes ?? [];
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
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Custom_notes_item(data: data[index]),
                    );
                  }),
            )
          ]),
        );
      },
    );
  }
}
