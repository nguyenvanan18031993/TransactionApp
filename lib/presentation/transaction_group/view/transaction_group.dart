import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:transaction_app/presentation/home/model/transaction_model.dart';
import 'package:transaction_app/presentation/home/redux/home_state.dart';
import 'package:transaction_app/presentation/home/viewmodel/home_view_model.dart';
import 'package:transaction_app/presentation/transaction_detail/view/transaction_detail_screen.dart';

class TransactionGroupScreen extends StatefulWidget {
  static const routeName = 'transactions-group-screen';
  const TransactionGroupScreen({super.key});

  @override
  State<TransactionGroupScreen> createState() => _TransactionGroupScreenState();
}

class _TransactionGroupScreenState extends State<TransactionGroupScreen> {
  Widget _getGroupSeparator(TransactionModel element) {
    return SizedBox(
      height: 50,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            border: Border.all(
              color: Colors.blue[300]!,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element.type,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getItem(BuildContext ctx, TransactionModel element) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionDetail(transaction: element),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: SizedBox(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: const Icon(Icons.food_bank),
            title: Text(element.transactionId),
            trailing: Text('\$${element.transactionAmount}'),
          ),
        ),
      ),
    );
  }

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
              child: viewModel.items != null && viewModel.items!.isNotEmpty
                  ? StickyGroupedListView<TransactionModel, String>(
                      elements: viewModel.items!,
                      order: StickyGroupedListOrder.ASC,
                      groupBy: (TransactionModel element) => element.type,
                      groupComparator: (String value1, String value2) => value2.compareTo(value1),
                      itemComparator: (TransactionModel element1, TransactionModel element2) =>
                          element1.type.compareTo(element2.type),
                      floatingHeader: true,
                      groupSeparatorBuilder: _getGroupSeparator,
                      itemBuilder: _getItem,
                    )
                  : const Center(
                      child: Text('Not Found Transactions'),
                    ),
            ),
          );
        });
  }
}
