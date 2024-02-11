// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempemailsystemqtec/Custom%20Widgets/message_box.dart';
import 'package:tempemailsystemqtec/Custom%20Widgets/top_bar.dart';
import 'package:tempemailsystemqtec/Provider/account_provider.dart';
import 'package:tempemailsystemqtec/Provider/token_provider.dart';
import 'package:tempemailsystemqtec/consts.dart';

import '../../Provider/messages_provider.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    String? token =
        Provider.of<TokenProvider>(context, listen: false).token.token;
    Provider.of<MessagesProvider>(context, listen: false)
        .getDomains(token: token!);
    Provider.of<AccountProvider>(context, listen: false)
        .getMyAccount(token: token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Temp Mail"),
        actions: [
          IconButton(
              onPressed: () {
                String? token =
                    Provider.of<TokenProvider>(context, listen: false)
                        .token
                        .token;
                Provider.of<MessagesProvider>(context, listen: false)
                    .getDomains(token: token!);
                Provider.of<AccountProvider>(context, listen: false)
                    .getMyAccount(token: token);
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      backgroundColor: mainColor.withOpacity(0.18),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 1),
            Consumer<AccountProvider>(builder: (context, account, child) {
              return TopBar(
                screenSize: screenSize,
                title: account.account.address.toString(),
              );
            }),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: screenSize.height * 0.05,
                width: screenSize.width,
                child: Text(
                  "Messages",
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 8,
              ),
              height: screenSize.height * 0.70,
              width: screenSize.width,
              child: Consumer<MessagesProvider>(
                builder: (context, messages, child) {
                  if (messages.messages.isNotEmpty) {
                    return ListView.builder(
                      itemCount: messages.messages.length,
                      itemBuilder: (context, index) => MessageBox(
                        screenSize: screenSize,
                        from:
                            "${messages.messages[index].from?.name} <${messages.messages[index].from?.address}>",
                        to: messages.messages[index].to!,
                        time: "${messages.messages[index].createdAt}",
                        subject: "${messages.messages[index].subject}",
                        details: "${messages.messages[index].intro}",
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
