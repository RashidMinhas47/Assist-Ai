import 'dart:convert';

import 'package:assist_ai/core/model/chat_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/message.dart';

class StorageService {
  static const String chatHistoryKey = 'chat_history';

  Future<void> saveChatHistory(List<Message> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedMessages = jsonEncode(messages.map((message) => message.toJson()).toList());
    await prefs.setStringList(chatHistoryKey, [encodedMessages]);
  }

  Future<List<Message>> loadChatHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedMessages = prefs.getStringList(chatHistoryKey) ?? [];
    if (encodedMessages.isEmpty) return [];
    final decodedMessages = jsonDecode(encodedMessages[0]) as List;
    return decodedMessages.map((message) => Message.fromJson(message)).toList();
    // final prefs = await SharedPreferences.getInstance();
    // final encodedMessages = prefs.getStringList(chatHistoryKey) ?? [];
    // return encodedMessages.map((encodedMessage) => Message.fromJson(encodedMessages)).toList();
  }
  Future<List<ChatModel>> loadConversationHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedMessages = prefs.getStringList(chatHistoryKey) ?? [];
    if (encodedMessages.isEmpty) return [];
    final decodedMessages = jsonDecode(encodedMessages[0]) as List;
    return decodedMessages.map((message) => Message.fromJson(message)).toList() as List<ChatModel>;
    // final prefs = await SharedPreferences.getInstance();
    // final encodedMessages = prefs.getStringList(chatHistoryKey) ?? [];
    // return encodedMessages.map((encodedMessage) => Message.fromJson(encodedMessages)).toList();
  }
}