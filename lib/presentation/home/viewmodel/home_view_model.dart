import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_app/base_redux/base_dispatch.dart';
import 'package:transaction_app/presentation/home/model/transaction_model.dart';
import 'package:transaction_app/presentation/home/redux/actions.dart';
import 'package:transaction_app/presentation/home/redux/home_state.dart';

class HomeViewModel extends BaseDispatch {
  List<TransactionModel>? items;
  final Function loadTransactionsList;
  final Function(String) setCancelTransaction;
  bool? successCalcel = false;
  final Function? resetSetCanCel;

  HomeViewModel(
      {this.items,
      required this.loadTransactionsList,
      this.resetSetCanCel,
      required this.setCancelTransaction,
      this.successCalcel});

  factory HomeViewModel.create(Store<HomeState> store) {
    // ignore: no_leading_underscores_for_local_identifiers
    _onLoadTransactionsList() async {
      // Fetch and decode data
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String musicsString = prefs.getString('localData') ?? '';

      List<TransactionModel> items = TransactionModel.decode(musicsString);
      store.dispatch(AddTransactionsAction(items));
    }

    // ignore: no_leading_underscores_for_local_identifiers
    _onSetCancelTransactionById(String transactionId) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      TransactionModel? item =
          store.state.transationsModel?.firstWhere((element) => element.transactionId == transactionId);
      if (item == null) return;
      // call store
      store.dispatch(DeleteTransactionAction(item));
      // save db local
      final String encodedData = TransactionModel.encode(store.state.transationsModel ?? []);
      await prefs.setString('localData', encodedData);
    }

    // ignore: no_leading_underscores_for_local_identifiers
    _onResetSetCanCel() {
      store.dispatch(ResetCancelAction());
    }

    return HomeViewModel(
        items: store.state.transationsModel,
        loadTransactionsList: _onLoadTransactionsList,
        setCancelTransaction: _onSetCancelTransactionById,
        successCalcel: store.state.successCanCelTransaction,
        resetSetCanCel: _onResetSetCanCel);
  }
}

typedef OnStateChanged = Function(bool isLoading);
