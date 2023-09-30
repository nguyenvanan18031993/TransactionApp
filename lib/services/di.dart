import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:transaction_app/data/api/api_services.dart';
import 'package:transaction_app/data/local/local_services.dart';
import 'package:transaction_app/data/repositories/api_repository.dart';
import 'package:transaction_app/presentation/home/viewmodel/home_view_model.dart';
import 'package:transaction_app/utils/app_route/app_routes.dart';
import 'package:transaction_app/utils/shared_pref_manager/shared_pref_helper.dart';
import 'package:transaction_app/utils/shared_pref_manager/shared_pref_manager.dart';

GetIt getIt = GetIt.instance;

setupDI() async {
  // AppRoutes initialization
  getIt.registerLazySingleton<AppRoutes>(() => AppRoutes());

  // Shared Preference Instance
  final pref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => pref);

  // Register Shared Pref Manager that depends on SharedPreferences
  getIt.registerLazySingleton(() => SharedPrefsManager(getIt.get()));

  getIt.registerSingleton(PreferenceUtils(), signalsReady: true);

  // ApiServices
  getIt.registerLazySingleton(() => ApiService(getIt.get()));

  // localservices
  getIt.registerLazySingleton(() => LocalService(getIt.get()));

  // Api Repository
  getIt.registerLazySingleton(() => ApiRepository(getIt.get()));

  // Api Repository
  getIt.registerLazySingleton(() => HomeViewModel(loadTransactionsList: () {}, setCancelTransaction: (_) {}));
}
