import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/home/view/home_screen.dart';
import 'package:transaction_app/presentation/login/view/login_screen.dart';
import 'package:transaction_app/presentation/splash/view/splash_screen.dart';
import 'package:transaction_app/presentation/transaction_detail/view/transaction_detail_screen.dart';
import 'package:transaction_app/presentation/transaction_group/view/transaction_group.dart';
import 'package:transaction_app/presentation/transactions/view/transactions.dart';

class AppRoutes {
  final Map<String, Widget Function(BuildContext)> routes = {
    '/': (_) => const SplashScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    LoginScreen.routeName: (_) => const LoginScreen(),
    TransactionDetail.routeName: (_) => const TransactionDetail(),
    TransactionsScreen.routeName: (_) => const TransactionsScreen(),
    TransactionGroupScreen.routeName: (_) => const TransactionGroupScreen()
  };
}
