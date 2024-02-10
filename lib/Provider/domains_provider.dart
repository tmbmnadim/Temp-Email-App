import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/Models/domains_model.dart';
import 'package:tempemailsystemqtec/Repos/get_domains_repo.dart';

class DomainsProvider extends ChangeNotifier{
  List<DomainsModel> domains = [];

  void getDomains() async {
    domains = await getDomainsRepo();
    notifyListeners();
  }
}