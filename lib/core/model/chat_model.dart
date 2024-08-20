import 'message.dart';

class ChatModel {
  final List<Message> messages;
  ChatModel({required this.messages});
  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    messages: json['messages'] as List<Message>,
    // dateTime: DateTime.parse(json['dateTime'] ?? ''), // Replace with default value if null
  );

  Map<String, dynamic> toJson() => {
    'messages': messages,
    // 'dateTime':dateTime
  };
}