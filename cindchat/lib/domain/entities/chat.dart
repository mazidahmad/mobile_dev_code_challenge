import 'package:cindchat/data/models/chat_model.dart';
import 'package:cindchat/domain/entities/contact.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  int? id;
  dynamic body;
  String? attachment;
  DateTime? timestamp;
  String? from;
  String? to;
  List<dynamic>? groupedContent;

  Chat(
      {this.id,
      required this.body,
      this.attachment,
      this.timestamp,
      this.from,
      this.to,
      this.groupedContent});

  Chat copyWith(
      {int? id,
      dynamic body,
      String? attachment,
      DateTime? timestamp,
      String? from,
      String? to,
      List<dynamic>? groupedContent}) {
    return Chat(
        id: id ?? this.id,
        body: body ?? this.body,
        attachment: attachment ?? this.attachment,
        timestamp: timestamp ?? this.timestamp,
        from: from ?? this.from,
        to: to ?? this.to,
        groupedContent: groupedContent ?? this.groupedContent);
  }

  ChatModel toModel() => ChatModel(
      id: id,
      attachment: attachment,
      timestamp: timestamp,
      from: from,
      to: to,
      body: (body != null && attachment != null && attachment == "contact")
          ? (body as Contact).toModel()
          : body);

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
