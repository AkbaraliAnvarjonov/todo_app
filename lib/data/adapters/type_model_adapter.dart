import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/models/type_model.dart';

class TypeModelAdapter extends TypeAdapter<TypeModel> {
  @override
  TypeModel read(BinaryReader reader) {
    final colorValue = reader.readInt();
    final name = reader.readString();
    final icon = reader.readString();
    final color = Color(colorValue);

    return TypeModel(
      color: color,
      name: name,
      icon: icon,
    );
  }

  @override
  void write(BinaryWriter writer, TypeModel obj) {
    writer.writeInt(obj.color.value);
    writer.writeString(obj.name);
    writer.writeString(obj.icon);
  }

  @override
  int get typeId => 0;
}
