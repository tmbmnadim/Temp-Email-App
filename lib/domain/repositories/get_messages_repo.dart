import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tempemailsystemqtec/data/Models/messages_model.dart';


int _requestLimiterMessages = 10;

Future<List<MessageModel>> getMessagesRepo({required String token, required List<MessageModel> preMessages}) async {
  List<MessageModel> messages = preMessages;

  /// This variable makes sure that it is only called once every 10 sec.
  _requestLimiterMessages++;

  if(_requestLimiterMessages == 10){
    ///---------------------------------------- Generating Request
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse('https://api.mail.tm/messages'));
    request.headers.addAll(headers);
    ///------------------------------------------------------------
    /// Sent the request and getting stream response as feedback
    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      messages.clear();

      /// Adding the response to a temp MessageModel and returning it.
      var decodedResponse = jsonDecode(await response.stream.bytesToString());
      for (var data in decodedResponse["hydra:member"]) {
        messages.add(MessageModel.fromJson(data));
      }
    } else {
      EasyLoading.showError(response.reasonPhrase!);
    }
  }else if(_requestLimiterMessages >10){
    _requestLimiterMessages = 0;
  }

  return messages;
}
