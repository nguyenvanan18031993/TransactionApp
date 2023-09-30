import 'package:transaction_app/presentation/home/model/transaction_model.dart';

class HomeState {
  List<TransactionModel>? transationsModel;
  bool? successCanCelTransaction = false;

  HomeState({
    this.transationsModel,
    this.successCanCelTransaction,
  });

  HomeState.formState(HomeState newState) {
    transationsModel = newState.transationsModel;
    successCanCelTransaction = newState.successCanCelTransaction;
  }

  List<TransactionModel>? get viewtransationsModel => transationsModel;

  bool? get viewSuccessCanCelTransaction => successCanCelTransaction;
}
