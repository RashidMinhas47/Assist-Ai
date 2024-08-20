// class MessageModel{
//   final bool isUser;
//   final String message;
//   final DateTime date;
//   MessageModel({required this.isUser,required this.message,required this.date});
// }

// models/message.dart
class Message {
  final String message;
  final bool isUser;
  // final DateTime dateTime;

  Message({required this.message, required this.isUser});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    message: json['message'] as String,
    isUser: json['isUser'] as bool,
    // dateTime: DateTime.parse(json['dateTime'] ?? ''), // Replace with default value if null
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'isUser': isUser,
    // 'dateTime':dateTime
  };
}

