import 'dart:convert';

import 'package:cindchat/data/models/contact_model.dart';
import 'package:cindchat/domain/entities/chat.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  int? id;
  dynamic body;
  String? attachment;
  DateTime? timestamp;
  String? from;
  String? to;
  ChatModel({
    this.id,
    required this.body,
    this.attachment,
    this.timestamp,
    this.from,
    this.to,
  });

  ChatModel copyWith({
    int? id,
    dynamic body,
    String? attachment,
    DateTime? timestamp,
    String? from,
    String? to,
  }) {
    return ChatModel(
      id: id ?? this.id,
      body: body ?? this.body,
      attachment: attachment ?? this.attachment,
      timestamp: timestamp ?? this.timestamp,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'body': (body != null && attachment != null && attachment is ContactModel)
          ? (body as ContactModel).toMap()
          : body,
      'attachment': attachment,
      'timestamp': timestamp?.millisecondsSinceEpoch.toString(),
      'from': from,
      'to': to,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'],
      body: map['body'] != null
          ? map['attachment'] == "contact"
              ? ContactModel.fromMap(map['body'])
              : map['body']
          : null,
      attachment: map['attachment'],
      timestamp: map['timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(int.parse(map['timestamp']))
          : null,
      from: map['from'],
      to: map['to'],
    );
  }

  String toJson() => json.encode(toMap());

  Chat toEntity() => Chat(
      id: id,
      attachment: attachment,
      from: from,
      to: to,
      timestamp: timestamp,
      body: body != null
          ? (attachment == "contact")
              ? (body as ContactModel).toEntity()
              : body
          : null);

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(id: $id, body: $body, attachment: $attachment, timestamp: $timestamp, from: $from, to: $to)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      body,
      attachment,
      timestamp,
      from,
      to,
    ];
  }
}
