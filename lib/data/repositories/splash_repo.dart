import 'package:hive/hive.dart';

class SplashRepository {
  static const _boxName = "splashBox";
  late Box _box;

  Future getBox() async {
    _box = await Hive.openBox(_boxName);
  }

  hasLoggedIn() {
    final isLoggedIn = _box.get('isLoggedIn') ?? false;
    return isLoggedIn;
  }

  setLoggedIn() {
    _box.put('isLoggedIn', true);
  }
}
