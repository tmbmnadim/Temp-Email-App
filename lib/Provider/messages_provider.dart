import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/Models/messages_model.dart';
import 'package:tempemailsystemqtec/Repos/get_messages_repo.dart';

class MessagesProvider extends ChangeNotifier{
  List<MessageModel> messages = [];

  void getDomains({required String token}) async {
    messages = await getMessagesRepo(token: token);
    notifyListeners();
  }
}