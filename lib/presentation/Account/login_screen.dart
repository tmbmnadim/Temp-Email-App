import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tempemailsystemqtec/domain/usecase/token_provider.dart';
import 'package:tempemailsystemqtec/presentation/Account/create_email_account.dart';
import 'package:tempemailsystemqtec/presentation/Custom%20Widgets/my_widgets.dart';
import 'package:tempemailsystemqtec/presentation/Custom%20Widgets/top_bar.dart';
import 'package:tempemailsystemqtec/presentation/Home/messages_screen.dart';
import '../../consts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.domain,
  });

  final String domain;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CustomWidgets customWidgets = CustomWidgets();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

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

            /// ========================== TopBar Widget
            TopBar(
              screenSize: screenSize,
              title: "Login",
            ),
            const SizedBox(height: 40),

            /// ================== Login Form
            Consumer<TokenProvider>(builder: (context, token, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: accountForm(
                  screenSize: screenSize,
                  domain: widget.domain,
                  onLogin: () {
                    EasyLoading.show(status: "Logging in...");
                    ///==============Retrieving Token to Login
                    token.getToken(
                      email: "${emailController.text}${widget.domain}",
                      password: passwordController.text,
                    );

                    /// Let's go to check our messages ===============>>>>>
                    if (token.token.token != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MessagesScreen(),
                        ),
                      );
                    }
                    EasyLoading.dismiss();
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
    required Size screenSize,
    required String domain,
    required Function() onLogin,
  }) {
    return Column(
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
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(10))),
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
          validator: (value) => _validateInput(value, "Password"),
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
            onPressed: () {
              obscureText = !obscureText;
              setState(() {});
            },
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          validator: (value) => _validateInput(value, "Password"),
        ),
        const SizedBox(height: 20),
        customWidgets.customButton(
          onTap: onLogin,
          color: mainColor,
          width: screenSize.width,
          splashColor: splashColor,
          child: const Text(
            "Login",
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
            text: "Don't have an Account? ",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: "Sign Up",
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
                        builder: (context) =>
                            const CreateEmailAccountScreen(domain: "@test.com"),
                      ),
                    );
                  },
              )
            ],
          ),
        ),
      ],
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
