import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note/constante.dart';
import 'package:note/model/note_models.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());

  addNote(NoteModel data) async {
    emit(AddLoading());
    try {
      var newData = Hive.box(kNewBox);

      await newData.add(data);
      emit(AddSuccess());
    } catch (e) {
      emit(AddFiald(errMassege: e.toString()));
    }
  }
}
