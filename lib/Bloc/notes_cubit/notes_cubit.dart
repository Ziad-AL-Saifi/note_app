import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note/model/note_models.dart';

import '../../constante.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  fetchNotes() {
    var newData = Hive.box<NoteModel>(kNewBox);
    notes = newData.values.toList();
    emit(NoteSuccess());
  }
}
