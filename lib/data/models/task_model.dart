import 'package:todo_app/data/models/type_model.dart';

class TaskModel {
  int id;
  String title;
  TypeModel type;
  DateTime day;
  bool isFinished;
  bool notify;

  TaskModel({
    required this.title,
    required this.id,
    required this.isFinished,
    required this.notify,
    required this.day,
    required this.type,
  });

  copyWith(
          {int? id,
          String? title,
          TypeModel? type,
          bool? isFinished,
          bool? notify,
          DateTime? day}) =>
      TaskModel(
          title: title ?? this.title,
          id: id ?? this.id,
          type: type ?? this.type,
          day: day ?? this.day,
          isFinished: isFinished ?? this.isFinished,
          notify: notify ?? this.notify);
}
