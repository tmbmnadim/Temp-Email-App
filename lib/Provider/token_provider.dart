import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/Models/login_token_model.dart';
import 'package:tempemailsystemqtec/Repos/get_token_repo.dart';

class TokenProvider extends ChangeNotifier {
  TokenModel token = TokenModel();

  void getToken({required String email, required String password}) async {
    token = await getTokenRepo(
      email: email,
      password: password,
    );
    notifyListeners();
  }
}
