import 'dart:convert';

CardDetails cardDetailsFromJson(String str) =>
    CardDetails.fromJson(json.decode(str));

String cardDetailsToJson(CardDetails data) => json.encode(data.toJson());

class CardDetails {
  final CardDetailsClass? cardDetails;

  CardDetails({
    this.cardDetails,
  });

  CardDetails copyWith({
    CardDetailsClass? cardDetails,
  }) =>
      CardDetails(
        cardDetails: cardDetails ?? this.cardDetails,
      );

  factory CardDetails.fromJson(Map<String, dynamic> json) => CardDetails(
        cardDetails: json["cardDetails"] == null
            ? null
            : CardDetailsClass.fromJson(json["cardDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "cardDetails": cardDetails?.toJson(),
      };
}

class CardDetailsClass {
  final String? cardId;
  final String? clientName;
  final String? accountNumber;
  final double? status;
  final String? expiryDate;

  CardDetailsClass({
    this.cardId,
    this.clientName,
    this.accountNumber,
    this.status,
    this.expiryDate,
  });

  CardDetailsClass copyWith({
    String? cardId,
    String? clientName,
    String? accountNumber,
    double? status,
    String? expiryDate,
  }) =>
      CardDetailsClass(
        cardId: cardId ?? this.cardId,
        clientName: clientName ?? this.clientName,
        accountNumber: accountNumber ?? this.accountNumber,
        status: status ?? this.status,
        expiryDate: expiryDate ?? this.expiryDate,
      );

  factory CardDetailsClass.fromJson(Map<String, dynamic> json) =>
      CardDetailsClass(
        cardId: json["cardId"],
        clientName: json["clientName"],
        accountNumber: json["accountNumber"],
        status: json["status"]?.toDouble(),
        expiryDate: json["expiryDate"],
      );

  Map<String, dynamic> toJson() => {
        "cardId": cardId,
        "clientName": clientName,
        "accountNumber": accountNumber,
        "status": status,
        "expiryDate": expiryDate,
      };
}
