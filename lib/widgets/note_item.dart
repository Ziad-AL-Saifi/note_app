import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Bloc/notes_cubit/notes_cubit.dart';
import 'package:note/model/note_models.dart';
import 'package:note/views/edit_view.dart';

class Custom_notes_item extends StatelessWidget {
  const Custom_notes_item({
    Key? key,
    required this.data,
  }) : super(key: key);
  final NoteModel data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditView(),
            ));
      }),
      child: Container(
        padding: const EdgeInsets.only(left: 24, top: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.amber[200]),
        child: Column(
          children: [
            ListTile(
                title: Text(
                  data.title,
                  style: const TextStyle(color: Colors.black, fontSize: 32),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    data.note,
                    style: TextStyle(
                        color: Colors.black.withOpacity(.4), fontSize: 18),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.black,
                  iconSize: 32,
                  onPressed: () {
                    data.delete();
                    BlocProvider.of<NotesCubit>(context).fetchNotes();
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 24, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    data.time.substring(1, 15),
                    style: TextStyle(
                      color: Colors.black.withOpacity(.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
