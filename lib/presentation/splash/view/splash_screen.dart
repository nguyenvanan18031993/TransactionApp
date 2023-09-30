import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_app/presentation/home/model/transaction_model.dart';
import 'package:transaction_app/presentation/home/redux/actions.dart';
import 'package:transaction_app/presentation/home/redux/home_state.dart';
import 'package:transaction_app/presentation/home/view/home_screen.dart';
import 'package:transaction_app/presentation/login/view/login_screen.dart';
import 'package:transaction_app/services/di.dart';
import 'package:transaction_app/utils/extensions/route_extension.dart';
import 'package:transaction_app/utils/shared_pref_manager/shared_pref_helper.dart';

class SplashScreen extends StatefulWidget {
  final Store<HomeState>? store;
  const SplashScreen({super.key, this.store});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<TransactionModel> transactions = [];

  @override
  void initState() {
    checkIsLogedIn();
    setDataLocal();
    super.initState();
  }

  void checkIsLogedIn() async {
    final authenticated = getIt<PreferenceUtils>().getBool('isLogedIn');
    if (authenticated) {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.pushNamed(HomeScreen.routeName);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.pushNamed(LoginScreen.routeName);
      });
    }
  }

  void setDataLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // static list to encode
    final String encodedData = TransactionModel.encode([
      TransactionModel(
          transactionId: "TS001",
          transactionAmount: 500,
          transactionDate: '21/03/2023',
          commission: "",
          total: 10000,
          type: 'replenishment',
          active: true),
      TransactionModel(
          transactionId: "TS002",
          transactionAmount: 100,
          transactionDate: '21/03/2023',
          commission: "",
          total: 10000,
          type: 'replenishment'),
      TransactionModel(
          transactionId: "TS003",
          transactionAmount: 5020,
          transactionDate: '22/03/2023',
          commission: "",
          total: 10000,
          type: 'withdrawal'),
      TransactionModel(
          transactionId: "TS004",
          transactionAmount: 5200,
          transactionDate: '22/03/2023',
          commission: "",
          total: 10000,
          type: 'withdrawal'),
      TransactionModel(
          transactionId: "TS005",
          transactionAmount: 200,
          transactionDate: '24/03/2023',
          commission: "",
          total: 10000,
          type: 'transfer'),
      TransactionModel(
          transactionId: "TS006",
          transactionAmount: 500,
          transactionDate: '24/03/2023',
          commission: "",
          total: 10000,
          type: 'transfer'),
    ]);
    if (prefs.containsKey('localData') || prefs.containsKey('isLogedIn')) return;
    await prefs.setString('localData', encodedData);
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<HomeState>(
      onInit: (store) => store.dispatch(AddTransactionsAction(transactions)),
      builder: (BuildContext context, Store<HomeState> store) => const Scaffold(
        body: Center(
          child: Text('Splash Screen'),
        ),
      ),
    );
  }
}

typedef OnItemsAddedCallback = Function(List<TransactionModel> items);
