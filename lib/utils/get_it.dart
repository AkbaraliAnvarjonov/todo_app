import 'package:get_it/get_it.dart';
import 'package:todo_app/data/repositories/splash_repo.dart';
import 'package:todo_app/data/repositories/task_repo.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => SplashRepository());
  locator.registerLazySingleton(() => TaskRepository());
  await locator<SplashRepository>().getBox();
  await locator<TaskRepository>().openBox();
}
