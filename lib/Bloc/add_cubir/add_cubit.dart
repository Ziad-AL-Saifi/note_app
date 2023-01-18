import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note/model/note_models.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());

  addNote(NoteModel data) {}
}
