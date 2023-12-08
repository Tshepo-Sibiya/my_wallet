import 'dart:convert';

Messages messagesFromJson(String str) => Messages.fromJson(json.decode(str));

String messagesToJson(Messages data) => json.encode(data.toJson());

class Messages {
  final Message? message;

  Messages({
    this.message,
  });

  Messages copyWith({
    Message? message,
  }) =>
      Messages(
        message: message ?? this.message,
      );

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
      };
}

class Message {
  final String? messageId;
  final String? clientId;
  final String? message;
  final String? dateTime;

  Message({
    this.messageId,
    this.clientId,
    this.message,
    this.dateTime,
  });

  Message copyWith({
    String? messageId,
    String? clientId,
    String? message,
    String? dateTime,
  }) =>
      Message(
        messageId: messageId ?? this.messageId,
        clientId: clientId ?? this.clientId,
        message: message ?? this.message,
        dateTime: dateTime ?? this.dateTime,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageId: json["messageId"],
        clientId: json["clientId"],
        message: json["message"],
        dateTime: json["dateTime"],
      );

  Map<String, dynamic> toJson() => {
        "messageId": messageId,
        "clientId": clientId,
        "message": message,
        "dateTime": dateTime,
      };
}
