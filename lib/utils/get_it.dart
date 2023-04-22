import 'package:get_it/get_it.dart';
import 'package:todo_app/data/repositories/splash_repo.dart';
import 'package:todo_app/data/repositories/task_repo.dart';
import 'package:todo_app/service/notification_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => SplashRepository());
  locator.registerLazySingleton(() => TaskRepository());
  locator.registerLazySingleton(() => LocalNotificationService());

  locator<LocalNotificationService>().init();
  await locator<SplashRepository>().getBox();
  await locator<TaskRepository>().openBox();
}
