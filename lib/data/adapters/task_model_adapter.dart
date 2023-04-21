import 'package:hive/hive.dart';
import 'package:todo_app/data/adapters/type_model_adapter.dart';
import 'package:todo_app/data/models/task_model.dart';

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  TaskModel read(BinaryReader reader) {
    final id = reader.readInt();
    final title = reader.readString();
    final type = TypeModelAdapter().read(reader);
    final day = DateTime.parse(reader.readString());
    final isFinished = reader.readBool();
    final notify = reader.readBool();
    return TaskModel(
      id: id,
      title: title,
      type: type,
      day: day,
      isFinished: isFinished,
      notify: notify,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    TypeModelAdapter().write(writer, obj.type);
    writer.writeString(obj.day.toIso8601String());
    writer.writeBool(obj.isFinished);
    writer.writeBool(obj.notify);
  }

  @override
  int get typeId => 0;
}
