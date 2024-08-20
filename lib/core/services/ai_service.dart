// services/ai_service.dart
import 'package:google_generative_ai/google_generative_ai.dart';

const String apiKey = "AIzaSyB1oj82X3iE5HeJQNXWvxibAlCVO-Nh3OM";
class AIService {
   Future<String> generateText(String prompt) async {
    // Replace with your API key
    final model =  GenerativeModel(apiKey: apiKey, model: 'gemini-pro');
    final message = Content.text(prompt);
    final response = await model.generateContent([message]);
    print(response.text);
    return response.text!;
  }
}

