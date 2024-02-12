import 'dart:async';
import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tempemailsystemqtec/data/Models/domains_model.dart';

Future<List<DomainsModel>> getDomainsRepo() async {
  List<DomainsModel> domains = [];

  try {
    /// ------------------------------ Sending request to get response
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://api.mail.tm/domains'));

    request.headers.addAll(headers);
    http.StreamedResponse response =
        await request.send();

    if (response.statusCode == 200) {
      domains.clear();
      var data = jsonDecode(await response.stream.bytesToString());

      /// adding the value to domains and returning it
      for (var member in data["hydra:member"]) {
        DomainsModel domain = DomainsModel.fromJson(member);
        domains.add(domain);
      }
    } else {
      EasyLoading.showError(response.reasonPhrase!);
    }
  } catch (e) {
    print(e);
    EasyLoading.showError("domainsRepo: $e");
  }

  return domains;
}
