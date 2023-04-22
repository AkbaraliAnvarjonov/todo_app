import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/data/models/task_model.dart';

class MyUtils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );

  static Map<DateTime, List<TaskModel>> sortDate({
    required List<TaskModel> tasks,
    required Map<DateTime, List<TaskModel>> daysMap,
  }) {
    for (var date in tasks) {
      DateTime day = DateTime(date.day.year, date.day.month, date.day.day);
      if (!daysMap.containsKey(day)) {
        daysMap[day] = [];
      }
      daysMap[day]?.add(date);
    }

    return daysMap;
  }
}
