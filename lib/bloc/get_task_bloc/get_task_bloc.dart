import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_event.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_state.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/data/repositories/task_repo.dart';
import 'package:todo_app/utils/get_it.dart';

class GetTaskBloc extends Bloc<GetTaskEvent, GetTaskState> {
  GetTaskBloc() : super(GetTaskInitial()) {
    on<GetTask>(getTask);
  }

  getTask(GetTask event, Emitter emit) async {
    emit(GetTaskLoading());

    List<TaskModel> tasks = locator<TaskRepository>().getTasks();

    emit(GetTaskSucces(tasks: tasks));
  }
}
