import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/data/Models/accounts_model.dart';
import 'package:tempemailsystemqtec/domain/repositories/create_accounts_repo.dart';
import 'package:tempemailsystemqtec/domain/repositories/my_account_repo.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel account = AccountModel();
  bool obscureText = true;

  /// This method calls repo to create new account.
  void createAccount({required String email, required String password}) async {
    account = await createAccountRepo(
      email: email,
      password: password,
    );
    notifyListeners();
  }

  /// This method calls repo get current user details.
  void getMyAccount({required String token}) async {
    account = await getMyAccountRepo(
      token: token,
    );
    notifyListeners();
  }

  /// This method switches the passwords visibility.
  void changeTextVisibility(){
    obscureText = !obscureText;
    notifyListeners();
  }
}
