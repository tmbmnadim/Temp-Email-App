import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tempemailsystemqtec/Models/login_token_model.dart';

String apiUrl = "https://api.mail.tm";

Future<TokenModel> getTokenRepo({
  required String email,
  required String password,
}) async {
  TokenModel token = TokenModel();
  try {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://api.mail.tm/token'));
    request.body = json.encode({
      "address": "nadimnadimnadim@mitico.org",
      "password": "postmannadim"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      /// ------------------- Convert response body to Map<String, Dynamic>
      final Map<String, dynamic> data = jsonDecode(await response.stream.bytesToString());
      token = TokenModel.fromJson(data);
    }
    else {
      EasyLoading.showError(response.reasonPhrase!);
    }
  } catch (e) {
    EasyLoading.showError("createaccountrepo: $e");
  }
  return token;
}
