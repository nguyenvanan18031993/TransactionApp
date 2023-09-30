import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/home/model/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: ListTile(
        leading: const Icon(Icons.food_bank),
        title: Text(transaction.transactionId),
        subtitle: Text(
          transaction.type.toString(),
        ),
        trailing: Text(
          '\$${transaction.transactionAmount}',
        ),
      ),
    );
  }
}
