import 'dart:developer';

import 'package:dart_openai/dart_openai.dart';

class ChatGPT {
 static String defaultModel = 'gpt-3.5-turbo';

  static List defaultRoles = [
    'system',
    'user',
    'assistant'
  ]; 



  static Future<OpenAIChatCompletionModel> sendMessage(
    List messages, {
    String model = '',
  }) async {
    // messages = filterMessageParams(messages);
    // log("messages after filter$messages");
    List<OpenAIChatCompletionChoiceMessageModel> modelMessages =
        convertListToModel(messages);
    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: model != '' ? model : defaultModel,
      messages: modelMessages,
    );
    return chatCompletion;
  }

  static List filterMessageParams(List messages) {
    List newMessages = [];
    for (var v in messages) {
      if (defaultRoles.contains(v['role'])) {
        newMessages.add({
          "role": v["role"],
          "content": v["content"],
        });
      }
    }
    return newMessages;
  }

  static getRoleFromString(String role) {
    if (role == "system") return OpenAIChatMessageRole.system;
    if (role == "user") return OpenAIChatMessageRole.user;
    if (role == "assistant") return OpenAIChatMessageRole.assistant;
    return "unknown";
  }

   static convertListToModel(List messages) {
    List<OpenAIChatCompletionChoiceMessageModel> modelMessages = [];
    for (var element in messages) {

      modelMessages.add(OpenAIChatCompletionChoiceMessageModel(
        role: getRoleFromString(element["role"]),
        content: element["content"],
      ));
    }
    return modelMessages;
  }

  
}
