import 'package:todo_app/data/models/task_model.dart';

abstract class GetTaskState {}

class GetTaskInitial extends GetTaskState {}

class GetTaskLoading extends GetTaskState {}

class GetTaskSucces extends GetTaskState {
  List<TaskModel> tasks;
  GetTaskSucces({required this.tasks});
}
