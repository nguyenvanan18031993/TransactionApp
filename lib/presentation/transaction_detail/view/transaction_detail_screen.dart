import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:transaction_app/presentation/home/model/transaction_model.dart';
import 'package:transaction_app/presentation/home/redux/home_state.dart';
import 'package:transaction_app/presentation/home/viewmodel/home_view_model.dart';
import 'package:transaction_app/presentation/transaction_detail/widget/transaction_detail_card.dart';

class TransactionDetail extends StatefulWidget {
  static const routeName = 'transaction-detail-screen';
  final TransactionModel? transaction;
  const TransactionDetail({super.key, this.transaction});

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<HomeState, HomeViewModel>(
        converter: (Store<HomeState> store) => HomeViewModel.create(store),
        distinct: true,
        onWillChange: (previousViewModel, newViewModel) {
          if (newViewModel.successCalcel == true) {
            newViewModel.resetSetCanCel!();
            Navigator.pop(context);
            return;
          }
        },
        rebuildOnChange: true,
        builder: (context, viewModel) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Transaction detail'),
            ),
            body: SafeArea(
              child: TransactionDetailCard(
                  onClickCancel: (transactionId) {
                    viewModel.setCancelTransaction(transactionId);
                  },
                  transaction: widget.transaction ??
                      TransactionModel(
                          transactionId: '',
                          transactionAmount: 0,
                          transactionDate: '',
                          commission: '',
                          total: 0,
                          type: '')),
            ),
          );
        });
  }
}
