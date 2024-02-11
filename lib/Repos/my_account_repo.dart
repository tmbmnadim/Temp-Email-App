import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tempemailsystemqtec/Models/accounts_model.dart';

Future<AccountModel> getMyAccountRepo({
  required String token,
}) async {
  AccountModel account = AccountModel();
  try {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse('https://api.mail.tm/me'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());
      account = AccountModel.fromJson(data);
    } else {
      EasyLoading.showError(response.headers["status"]!);
    }
  } catch (e) {
    EasyLoading.showError("getmyaccountrepo: $e");
  }
  return account;
}
