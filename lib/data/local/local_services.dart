import 'package:transaction_app/utils/shared_pref_manager/shared_pref_manager.dart';

class LocalService {
  final SharedPrefsManager _sharedPrefsManager;

  LocalService(this._sharedPrefsManager);

  Future<bool> checlIsLogedIn() async {
    final isLogedIn = await _sharedPrefsManager.getData(_sharedPrefsManager.isLogedIn);
    return isLogedIn != null ? true : false;
  }
}
