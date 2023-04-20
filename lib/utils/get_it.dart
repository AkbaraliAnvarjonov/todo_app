import 'package:get_it/get_it.dart';
import 'package:todo_app/data/repositories/splash_repo.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SplashRepository());
}
