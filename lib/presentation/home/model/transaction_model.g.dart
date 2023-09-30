// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) => TransactionModel(
    transactionId: json['transactionId'] as String,
    transactionAmount: json['transactionAmount'] as double,
    transactionDate: json['transactionDate'] as String,
    commission: json['commission'] as String,
    total: (json['total'] as num).toDouble(),
    type: json['type'] as String);

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) => <String, dynamic>{
      'transactionId': instance.transactionId,
      'transactionAmount': instance.transactionAmount,
      'transactionDate': instance.transactionDate,
      'commission': instance.commission,
      'total': instance.total,
      'type': instance.type,
    };
