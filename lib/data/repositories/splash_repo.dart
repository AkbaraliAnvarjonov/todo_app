import 'package:hive/hive.dart';

class SplashRepository {
  static const _boxName = 'splashBox';
  late Box _box;

  Future<Box> _getBox() async {
    _box = await Hive.openBox(_boxName);
    return _box;
  }

  Future<bool> hasLoggedIn() async {
    final isLoggedIn = _box.get('isLoggedIn') ?? false;
    return isLoggedIn;
  }

  Future<void> setLoggedIn() async {
    final box = await _getBox();
    await box.put('isLoggedIn', true);
  }
}
