import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transaction_app/presentation/home/redux/home_reducer.dart';
import 'package:transaction_app/presentation/home/redux/home_state.dart';
import 'package:transaction_app/services/di.dart';
import 'package:transaction_app/utils/app_contants/app_context.dart';
import 'package:transaction_app/utils/app_route/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<HomeState>(
        store: homeStore,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: GlobalContext.navigatorKey,
          themeMode: ThemeMode.light,
          routes: getIt<AppRoutes>().routes,
        ));
  }
}
