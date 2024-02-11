import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/Models/accounts_model.dart';
import 'package:tempemailsystemqtec/Repos/my_account_repo.dart';
import '../Repos/create_accounts_repo.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel account = AccountModel();
  bool obscureText = true;

  void createAccount({required String email, required String password}) async {
    account = await createAccountRepo(
      email: email,
      password: password,
    );
    notifyListeners();
  }

  void getMyAccount({required String token}) async {
    account = await getMyAccountRepo(
      token: token,
    );
    notifyListeners();
  }

  void changeTextVisibility(){
    obscureText = !obscureText;
    notifyListeners();
  }
}
