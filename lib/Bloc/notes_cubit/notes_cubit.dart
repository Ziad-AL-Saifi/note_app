import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note/model/note_models.dart';

import '../../constante.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchNotes(NoteModel data) async {
    emit(NotesLoading());
    try {
      var newData = Hive.box<NoteModel>(kNewBox);
      emit(NotesSuccess(data: newData.values.toList()));
    } catch (e) {
      emit(Notesfield(errMassege: e.toString()));
    }
  }
}
