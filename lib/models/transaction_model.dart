import 'dart:convert';

Transactions transactionsFromJson(String str) =>
    Transactions.fromJson(json.decode(str));

String transactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
  final List<Transaction>? transaction;

  Transactions({
    this.transaction,
  });

  Transactions copyWith({
    List<Transaction>? transaction,
  }) =>
      Transactions(
        transaction: transaction ?? this.transaction,
      );

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        transaction: json["transaction"] == null
            ? []
            : List<Transaction>.from(
                json["transaction"]!.map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transaction": transaction == null
            ? []
            : List<dynamic>.from(transaction!.map((x) => x.toJson())),
      };
}

class Transaction {
  final String? transactionId;
  final String? name;
  final String? description;
  final double? amount;
  final String? transactionImageUrl;

  Transaction({
    this.transactionId,
    this.name,
    this.description,
    this.amount,
    this.transactionImageUrl,
  });

  Transaction copyWith({
    String? transactionId,
    String? name,
    String? description,
    double? amount,
    String? transactionImageUrl,
  }) =>
      Transaction(
        transactionId: transactionId ?? this.transactionId,
        name: name ?? this.name,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        transactionImageUrl: transactionImageUrl ?? this.transactionImageUrl,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        transactionId: json["transactionId"],
        name: json["name"],
        description: json["description"],
        amount: json["amount"]?.toDouble(),
        transactionImageUrl: json["transactionImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
        "name": name,
        "description": description,
        "amount": amount,
        "transactionImageUrl": transactionImageUrl,
      };
}
