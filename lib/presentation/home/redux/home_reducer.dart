import 'package:transaction_app/presentation/home/redux/actions.dart';
import 'package:transaction_app/presentation/home/redux/home_state.dart';
import 'package:redux/redux.dart';

final homeStore = Store<HomeState>(
  homeReducer,
  initialState: HomeState(), // Initial state
);

HomeState homeReducer(HomeState newState, dynamic action) {
  if (action is AddTransactionsAction) {
    newState.transationsModel = action.item;
  } else if (action is DeleteTransactionAction) {
    newState.successCanCelTransaction = true;
    newState.transationsModel?.removeWhere((element) => element.transactionId == action.item.transactionId);
  } else if (action is ResetCancelAction) {
    newState.successCanCelTransaction = false;
  }

  return newState;
}
