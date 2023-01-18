// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'note_models.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String note;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final int color;
  NoteModel({
    required this.title,
    required this.note,
    required this.time,
    required this.color,
  });
}
