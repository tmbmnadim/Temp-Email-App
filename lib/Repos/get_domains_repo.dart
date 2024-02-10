import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tempemailsystemqtec/Models/domains_model.dart';

String apiUrl = "https://api.mail.tm";

Future<List<DomainsModel>> getDomainsRepo() async {
  List<DomainsModel> domains = [];
  final http.Response response = await http.get(Uri.parse("$apiUrl/domains"));
  final Map<String, dynamic> data = jsonDecode(response.body);
  for(var member in data["hydra:member"]){
    DomainsModel domain = DomainsModel.fromJson(member);
    domains.add(domain);
  }
  return domains;
}
