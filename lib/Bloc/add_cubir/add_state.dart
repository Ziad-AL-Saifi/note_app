// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_cubit.dart';

@immutable
abstract class AddState {}

class AddInitial extends AddState {}

class AddLoading extends AddState {}

class AddSuccess extends AddState {}

class AddFiald extends AddState {
  String errMassege;
  AddFiald({
    required this.errMassege,
  });
}
