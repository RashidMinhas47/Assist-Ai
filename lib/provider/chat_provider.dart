// providers/chat_provider.dart
import 'package:assist_ai/provider/textediting_ctr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assist_ai/core/model/chat_model.dart';
import 'package:assist_ai/core/services/ai_service.dart';
import 'package:assist_ai/core/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/model/chat_model.dart';
import '../core/model/message.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatModel>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  final aiService = ref.watch(aiServiceProvider);
  return ChatNotifier(storageService: storageService, aiService: aiService);
});

final aiServiceProvider = Provider<AIService>((ref) => AIService());
final storageServiceProvider = Provider<StorageService>((ref) => StorageService());
class ChatNotifier extends StateNotifier<ChatModel> {
  final StorageService storageService;
  final AIService aiService;
  bool isSending = false;


  ChatNotifier({required this.storageService, required this.aiService}) : super(ChatModel(messages: [])) {
    _loadChatHistory();
  }

  Future<void> _loadChatHistory() async {
    final chatHistory = await storageService.loadChatHistory();
    state = ChatModel(messages: chatHistory);
  }

  void sendMessage(String text,WidgetRef ref) async {
   try{
     isSending = true;
     ref.watch(messageCtrProvider).clear();

     state = ChatModel(messages: [...state.messages, Message(message: text, isUser: true,)]);
     final response = await aiService.generateText(text);
     state = ChatModel(messages: [...state.messages, Message(message: response, isUser: false,)]);
     isSending = false;

     await storageService.saveChatHistory(state.messages);
   }catch(e){

   }
  }
  Future<void> clearAllSharedPreferencesData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    state = ChatModel(messages: []);
  }
}