import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tempemailsystemqtec/Models/accounts_model.dart';
import 'package:tempemailsystemqtec/Models/login_token_model.dart';

String apiUrl = "https://api.mail.tm";

Future<LoginTokenModel> getTokenRepo({
  required String email,
  required String password,
}) async {
  LoginTokenModel token = LoginTokenModel();
  try {
    Map<String, dynamic> body = {"address": email, "password": password};

    /// -------------- Create Account and Save data
    final http.Response response =
    await http.post(Uri.parse("$apiUrl/token"), body: body);
    if (response.headers["status"] == "201 Created") {
      /// ------------------- Convert response body to Map<String, Dynamic>
      final Map<String, dynamic> data = jsonDecode(response.body);
      token = LoginTokenModel.fromJson(data);
    } else {
      EasyLoading.showError(response.headers["status"]!);
    }
  } catch (e) {
    EasyLoading.showError("createaccountrepo: $e");
  }
  return token;
}
