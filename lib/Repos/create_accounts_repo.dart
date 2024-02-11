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
    EasyLoading.show(status: "Creating Account...");
    /// -------------------------------------------------Generating Request
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('https://api.mail.tm/accounts'));
    request.body = json.encode({"address": email, "password": password});
    request.headers.addAll(headers);
    /// -------------------------------------------------------------------
    /// ----------------Here the request is sent and a response is received
    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      ///-------------------------- Adding the data to account  (AccountModel)
      /// Reading the data from response stream
      final Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());
      account = AccountModel.fromJson(data);

      EasyLoading.showSuccess("Account Created");

    } else {
      EasyLoading.showError(response.headers["status"]!);
    }
    EasyLoading.dismiss();
  } catch (e) {
    EasyLoading.showError("createaccountrepo: $e");
  }
  return account;
}
