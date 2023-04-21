import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/app/bloc_observer.dart';
import 'package:todo_app/data/adapters/task_model_adapter.dart';
import 'package:todo_app/utils/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskModelAdapter());
  setupLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
