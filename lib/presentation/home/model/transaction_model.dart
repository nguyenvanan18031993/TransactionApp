import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  final String transactionId;
  final double transactionAmount;
  final String transactionDate;
  final String commission;
  final double total;
  final String type;
  final bool? active;

  TransactionModel(
      {required this.transactionId,
      required this.transactionAmount,
      required this.transactionDate,
      required this.commission,
      required this.total,
      required this.type,
      this.active});

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  static Map<String, dynamic> toMap(TransactionModel music) => {
        'transactionId': music.transactionId,
        'transactionAmount': music.transactionAmount,
        'transactionDate': music.transactionDate,
        'commission': music.commission,
        'type': music.type,
        'total': music.total,
        'active': music.active,
      };

  static String encode(List<TransactionModel> musics) => json.encode(
        musics.map<Map<String, dynamic>>((music) => TransactionModel.toMap(music)).toList(),
      );

  static List<TransactionModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>).map<TransactionModel>((item) => TransactionModel.fromJson(item)).toList();
}
