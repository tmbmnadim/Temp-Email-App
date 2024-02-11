import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempemailsystemqtec/Custom%20Widgets/my_widgets.dart';
import 'package:tempemailsystemqtec/Custom%20Widgets/top_bar.dart';
import 'package:tempemailsystemqtec/Provider/account_provider.dart';
import 'package:tempemailsystemqtec/consts.dart';

import 'login_screen.dart';

class CreateEmailAccountScreen extends StatefulWidget {
  const CreateEmailAccountScreen({
    super.key,
    required this.domain,
  });

  final String domain;

  @override
  State<CreateEmailAccountScreen> createState() =>
      _CreateEmailAccountScreenState();
}

class _CreateEmailAccountScreenState extends State<CreateEmailAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CustomWidgets customWidgets = CustomWidgets();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temp Mail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 1),

            /// ============================= TopBar Widget
            TopBar(
              screenSize: screenSize,
              title: "Create Email Account",
            ),
            const SizedBox(height: 40),

            /// ============================= Account Creation Form
            Consumer<AccountProvider>(builder: (context, account, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: accountForm(
                  formKey: _formKey,
                  screenSize: screenSize,
                  obscureText: account.obscureText,
                  onObscure: () {
                    account.changeTextVisibility();
                  },
                  loginDomain: widget.domain,
                  domain: widget.domain,
                  onCreate: () {
                    ///--------------- verifying fields
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      /// ---------- AccountProvider.createAccount
                      account.createAccount(
                        email: "${emailController.text}${widget.domain}",
                        password: passwordController.text,
                      );

                      /// Redirecting to Messages Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LoginScreen(domain: widget.domain),
                        ),
                      );
                    }
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget accountForm({
    required Key formKey,
    required Size screenSize,
    required String domain,
    required String loginDomain,
    required bool obscureText,
    required Function() onObscure,
    required Function() onCreate,
  }) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customWidgets.customTextField(
            hintText: "Enter Email",
            controller: emailController,
            hintColor: Colors.black54,
            labelColor: Colors.black54,
            fillColor: Colors.white,
            enabledBorderColor: Colors.transparent,
            focusedColor: mainColor,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(10),
                ),
              ),
              width: screenSize.width * 0.45,
              child: Text(
                "   $domain",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                ),
              ),
            ),
            validator: (value) =>
                _validateInput("$value${widget.domain}", "Email"),
          ),
          const SizedBox(height: 20),
          customWidgets.customTextField(
            hintText: "Enter Password",
            controller: passwordController,
            hintColor: Colors.black54,
            labelColor: Colors.black54,
            fillColor: Colors.white,
            enabledBorderColor: Colors.transparent,
            focusedColor: mainColor,
            prefixIcon: const Icon(Icons.lock_outline),
            obscureText: obscureText,
            suffixIcon: IconButton(
              onPressed: onObscure,
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) => _validateInput(value, "Password"),
          ),
          const SizedBox(height: 20),
          customWidgets.customButton(
            onTap: onCreate,
            color: mainColor,
            width: screenSize.width,
            splashColor: splashColor,
            child: const Text(
              "Create",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Login",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(
                            domain: loginDomain,
                          ),
                        ),
                      );
                    },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String? _validateInput(String? value, String field) {
    if (value == null || value.isEmpty) {
      return '$field is required.';
    } else if (field == 'Email' && !isValidEmail(value)) {
      return 'Please enter a valid email address.';
    } else if (field == 'Password' && !isValidPassword(value)) {
      return 'Password must contain both letters and numbers.';
    }
    return null;
  }

  bool isValidEmail(String email) {
    // Use a regex pattern to validate the email format.
    const emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    return RegExp(emailPattern).hasMatch(email);
  }

  bool isValidPassword(String password) {
    // Replace this with your password validation logic.
    // This example requires at least one letter and one number.
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    return hasLetter && hasNumber;
  }
}
