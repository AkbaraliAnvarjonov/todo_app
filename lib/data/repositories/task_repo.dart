import 'package:hive/hive.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/service/notification_service.dart';
import 'package:todo_app/utils/get_it.dart';
import 'package:todo_app/utils/my_utils.dart';

class TaskRepository {
  static const _boxName = "taskBox";
  late Box<TaskModel> _box;

  Future openBox() async {
    _box = await Hive.openBox(_boxName);
  }

  addTask(TaskModel task) {
    task.id = _box.values.length + 1;
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

  setNotification(TaskModel task) {
    locator<LocalNotificationService>().scheduleNotification(
        task: task, time: MyUtils.getDifferenceInSeconds(task.day));
  }

  cancelNotification(int id) {
    locator<LocalNotificationService>().cancelNotificationById(id);
  }
}
