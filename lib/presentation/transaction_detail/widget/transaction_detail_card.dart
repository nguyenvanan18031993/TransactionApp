import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/home/model/transaction_model.dart';
import 'package:transaction_app/utils/app_contants/app_constants.dart';
import 'package:transaction_app/widgets/base_flat_button.dart';

class TransactionDetailCard extends StatelessWidget {
  final TransactionModel transaction;
  final Function(String) onClickCancel;
  const TransactionDetailCard({super.key, required this.transaction, required this.onClickCancel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Colors.greenAccent[100],
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Padding(
              padding: EdgeInsets.all(AppConstants.padding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Transaction Date : ${transaction.transactionDate}',
                    style: AppConstants.textDefault,
                  ),
                  SizedBox(
                    height: AppConstants.padding5,
                  ),
                  Text(
                    'Amount : \$${transaction.transactionAmount}',
                    style: AppConstants.textDefault,
                  ),
                  SizedBox(
                    height: AppConstants.padding5,
                  ),
                  Text(
                    'Commission : ${transaction.type}',
                    style: AppConstants.textDefault,
                  ),
                  SizedBox(
                    height: AppConstants.padding5,
                  ),
                  Text(
                    'Total : \$${transaction.total}',
                    style: AppConstants.textDefault,
                  ),
                  SizedBox(
                    height: AppConstants.padding5,
                  ),
                  Text(
                    'Transaction number : ${transaction.transactionId}',
                    style: AppConstants.textDefault,
                  ),
                  SizedBox(
                    height: AppConstants.padding5,
                  ),
                  AppFlatButton(
                      text: 'Cancel',
                      onPressed: () {
                        onClickCancel(transaction.transactionId);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
