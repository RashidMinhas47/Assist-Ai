import 'package:assist_ai/core/model/coversation_model.dart';
import 'package:assist_ai/provider/textediting_ctr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assist_ai/core/model/chat_model.dart';
import 'package:assist_ai/core/services/ai_service.dart';
import 'package:assist_ai/core/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/model/chat_model.dart';
import '../core/model/message.dart';

final chatProvider = StateNotifierProvider<ConversationNotifier, ConversationModel>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  final aiService = ref.watch(aiServiceProvider);
  return ConversationNotifier(storageService: storageService, aiService: aiService);
});

final aiServiceProvider = Provider<AIService>((ref) => AIService());
final storageServiceProvider = Provider<StorageService>((ref) => StorageService());
class ConversationNotifier extends StateNotifier<ConversationModel> {
  final StorageService storageService;
  final AIService aiService;
  bool isSending = false;


  ConversationNotifier({required this.storageService, required this.aiService}) : super(ConversationModel(chatModel: [])) {
    _loadChatHistory();
  }

  Future<void> _loadChatHistory() async {
    final chatHistory = await storageService.loadConversationHistory();
    state = ConversationModel(chatModel: chatHistory);
  }

  //TODO: latter perhaps it will need
  // void sendMessage(String text,WidgetRef ref) async {
  //   try{
  //     isSending = true;
  //     ref.watch(messageCtrProvider).clear();
  //
  //     state = ChatModel(messages: [...state.messages, Message(message: text, isUser: true,)]);
  //     final response = await aiService.generateText(text);
  //     state = ChatModel(messages: [...state.messages, Message(message: response, isUser: false,)]);
  //     isSending = false;
  //
  //     await storageService.saveChatHistory(state.messages);
  //   }catch(e){
  //
  //   }
  // }
  Future<void> deleteConversation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    state = ConversationModel(chatModel: []);
  }
}