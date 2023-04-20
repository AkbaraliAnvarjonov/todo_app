import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/app/bloc_observer.dart';
import 'package:todo_app/utils/get_it.dart';

void main() {
  setupLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
