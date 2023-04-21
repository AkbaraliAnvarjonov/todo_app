import 'package:hive/hive.dart';
import 'package:todo_app/data/models/task_model.dart';

class TaskRepository {
  static const _boxName = "taskBox";
  late Box<TaskModel> _box;

  Future openBox() async {
    _box = await Hive.openBox(_boxName);
  }

  addTask(TaskModel task) {
    task.id = _box.values.length;

    _box.put(task.id, task);
  }

  List<TaskModel> getTasks() {
    return _box.values.toList();
  }

  deleteTasks(int id) {
    _box.delete(id);
  }

  updateTask(TaskModel task) {
    _box.put(task.id, task);
  }
}
