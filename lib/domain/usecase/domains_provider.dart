import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/data/Models/domains_model.dart';
import 'package:tempemailsystemqtec/domain/repositories/get_domains_repo.dart';

class DomainsProvider extends ChangeNotifier {
  List<DomainsModel> domains = [];

  /// Get the available domains
  void getDomains() async {
    domains = await getDomainsRepo();
    notifyListeners();
  }
}
