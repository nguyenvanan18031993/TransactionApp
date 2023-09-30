import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:transaction_app/presentation/home/redux/home_state.dart';
import 'package:transaction_app/presentation/home/viewmodel/home_view_model.dart';
import 'package:transaction_app/presentation/transaction_detail/view/transaction_detail_screen.dart';
import 'package:transaction_app/presentation/transactions/widget/transaction_card.dart';

class TransactionsScreen extends StatefulWidget {
  static const routeName = 'transactions-screen';
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<HomeState, HomeViewModel>(
        converter: (Store<HomeState> store) => HomeViewModel.create(store),
        onInitialBuild: (vm) {
          vm.loadTransactionsList();
        },
        builder: (context, viewModel) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: viewModel.items != null && viewModel.items!.isNotEmpty
                    ? ListView(
                        children: viewModel.items!.map((transaction) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransactionDetail(transaction: transaction),
                              ),
                            );
                          },
                          child: TransactionCard(transaction: transaction),
                        );
                      }).toList())
                    : const Center(child: Text('Not Found Transactions')),
              ),
            ),
          );
        });
  }
}
