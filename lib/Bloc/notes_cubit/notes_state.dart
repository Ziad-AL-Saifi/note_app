// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesSuccess extends NotesState {
  List<NoteModel> data;
  NotesSuccess({
    required this.data,
  });
}

class Notesfield extends NotesState {
  String errMassege;
  Notesfield({
    required this.errMassege,
  });
}
