import 'package:transaction_app/presentation/home/model/transaction_model.dart';
import 'package:transaction_app/presentation/home/viewmodel/home_view_model.dart';
import 'package:equatable/equatable.dart';

class FetchItemsAction extends Equatable {
  final OnStateChanged callback;

  const FetchItemsAction(this.callback);

  @override
  List<Object> get props => [callback];
}

class DeleteTransactionAction extends Equatable {
  final TransactionModel item;

  const DeleteTransactionAction(this.item);

  @override
  List<Object> get props => [item];
}

class ResetCancelAction {
  ResetCancelAction();
}

class AddTransactionsAction extends Equatable {
  final List<TransactionModel> item;

  const AddTransactionsAction(this.item);

  @override
  List<Object> get props => [item];
}

class ItemLoadedAction extends Equatable {
  final List<TransactionModel> items;

  const ItemLoadedAction(this.items);

  @override
  List<Object> get props => [items];
}
