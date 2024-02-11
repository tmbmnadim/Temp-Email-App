import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tempemailsystemqtec/Provider/account_provider.dart';
import 'package:tempemailsystemqtec/Provider/domains_provider.dart';
import 'package:tempemailsystemqtec/Provider/messages_provider.dart';
import 'package:tempemailsystemqtec/Provider/token_provider.dart';
import 'package:tempemailsystemqtec/Screens/domain_screen.dart';
import 'consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DomainsProvider()),
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => MessagesProvider()),
        ChangeNotifierProvider(create: (context) => TokenProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QTec',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: mainColor,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            centerTitle: true,
          ),
          colorScheme: ColorScheme(
            background: backgroundColor,
            onBackground: backgroundColor,
            brightness: Brightness.light,
            error: Colors.red,
            onError: Colors.red,
            primary: Colors.white,
            onPrimary: Colors.white,
            secondary: Colors.white,
            onSecondary: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        home: const DomainScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
