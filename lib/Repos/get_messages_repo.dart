import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tempemailsystemqtec/Models/domains_model.dart';
import 'package:tempemailsystemqtec/Models/messages_model.dart';

Future<List<MessagesModel>> getMessagesRepo({required String token}) async {
  List<MessagesModel> messages = [];
  var headers = {'Authorization': 'Bearer $token'};
  var request = http.Request('GET', Uri.parse('https://api.mail.tm/messages'));
  request.body = '''''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    final List<Map<String, dynamic>> datas = [];
    datas.addAll(jsonDecode(await response.stream.bytesToString()));
    for (var data in datas) {
      messages.add(MessagesModel.fromJson(data));
    }
  } else {
    print(response.reasonPhrase);
    EasyLoading.showError(response.reasonPhrase!);
  }

  return messages;
}
