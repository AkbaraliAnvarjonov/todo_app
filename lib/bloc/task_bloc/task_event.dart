import 'package:todo_app/data/models/task_model.dart';

abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  AddTaskEvent({required this.taskModel});
}

class DeleteTaskEvent extends TaskEvent {
  final int id;

  DeleteTaskEvent({required this.id});
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  UpdateTaskEvent({required this.taskModel});
}
