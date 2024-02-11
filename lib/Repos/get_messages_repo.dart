import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tempemailsystemqtec/Models/messages_model.dart';

Future<List<MessageModel>> getMessagesRepo({required String token}) async {
  List<MessageModel> messages = [];

  ///---------------------------------------- Generating Request
  var headers = {'Authorization': 'Bearer $token'};
  var request = http.Request('GET', Uri.parse('https://api.mail.tm/messages'));
  request.body = '''''';
  request.headers.addAll(headers);
  ///------------------------------------------------------------
  /// Sent the request and getting stream response as feedback
  http.StreamedResponse response = await request.send();


  if (response.statusCode == 200) {
    /// Adding the response to a temp MessageModel and returning it.
    var decodedResponse = jsonDecode(await response.stream.bytesToString());
    for (var data in decodedResponse["hydra:member"]) {
      messages.add(MessageModel.fromJson(data));
    }
  } else {
    EasyLoading.showError(response.reasonPhrase!);
  }

  return messages;
}
