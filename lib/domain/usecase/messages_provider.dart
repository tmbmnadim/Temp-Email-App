import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/data/Models/messages_model.dart';
import 'package:tempemailsystemqtec/domain/repositories/get_messages_repo.dart';

class MessagesProvider extends ChangeNotifier{
  List<MessageModel> messages = [];

  /// Get messages

  void getDomains({required String token}) async {
    messages = await getMessagesRepo(token: token);
    notifyListeners();
  }
}