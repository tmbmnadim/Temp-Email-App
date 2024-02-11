import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tempemailsystemqtec/Models/accounts_model.dart';

Future<AccountModel> createAccountRepo({
  required String email,
  required String password,
}) async {
  AccountModel account = AccountModel();
  try {
    var headers = {'Content-Type': 'application/json'};
    var request =
    http.Request('POST', Uri.parse('https://api.mail.tm/accounts'));
    request.body = json.encode({"address": email, "password": password});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
      jsonDecode(await response.stream.bytesToString());
      account = AccountModel.fromJson(data);
      EasyLoading.showSuccess("Account Created");
    } else {
      EasyLoading.showError(response.headers["status"]!);
    }
  } catch (e) {
    EasyLoading.showError("createaccountrepo: $e");
  }
  return account;
}
