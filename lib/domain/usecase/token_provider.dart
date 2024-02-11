import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/data/Models/login_token_model.dart';
import 'package:tempemailsystemqtec/domain/repositories/get_token_repo.dart';

class TokenProvider extends ChangeNotifier {
  TokenModel token = TokenModel();

  /// Retrieve token for user.

  void getToken({required String email, required String password}) async {
    token = await getTokenRepo(
      email: email,
      password: password,
    );
    notifyListeners();
  }

  void cleanToken(){
    token = TokenModel();
    notifyListeners();
  }
}
