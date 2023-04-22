import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_bloc/task_event.dart';
import 'package:todo_app/bloc/task_bloc/task_state.dart';
import 'package:todo_app/data/repositories/task_repo.dart';
import 'package:todo_app/utils/get_it.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(addTask);
    on<DeleteTaskEvent>(deleteTask);
    on<UpdateTaskEvent>(updateTask);
  }

  addTask(AddTaskEvent event, Emitter emit) async {
    emit(TaskAddLoading());

    await locator<TaskRepository>().addTask(event.taskModel);
    locator<TaskRepository>().setNotification(event.taskModel);
    emit(TaskAddSucces());
  }

  updateTask(UpdateTaskEvent event, Emitter emit) async {
    await locator<TaskRepository>().updateTask(event.taskModel);
    if (event.taskModel.isFinished == true || event.taskModel.notify == false) {
      locator<TaskRepository>().cancelNotification(event.taskModel.id);
    } else {
      locator<TaskRepository>().setNotification(event.taskModel);
    }
    emit(TaskUpdateSucces());
  }

  deleteTask(DeleteTaskEvent event, Emitter emit) async {
    await locator<TaskRepository>().deleteTasks(event.id);
    locator<TaskRepository>().cancelNotification(event.id);
    emit(TaskDeleteSucces());
  }
}
