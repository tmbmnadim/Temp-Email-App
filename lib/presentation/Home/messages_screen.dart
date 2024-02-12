import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempemailsystemqtec/consts.dart';
import 'package:tempemailsystemqtec/domain/usecase/account_provider.dart';
import 'package:tempemailsystemqtec/domain/usecase/messages_provider.dart';
import 'package:tempemailsystemqtec/domain/usecase/token_provider.dart';
import 'package:tempemailsystemqtec/presentation/Custom%20Widgets/message_box.dart';
import 'package:tempemailsystemqtec/presentation/Custom%20Widgets/top_bar.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  String? token;
  @override
  void initState() {
    token = Provider.of<TokenProvider>(context, listen: false).token.token;
    Provider.of<AccountProvider>(context, listen: false)
        .getMyAccount(token: token!);
    Provider.of<MessagesProvider>(context, listen: false)
        .getMessages(token: token!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// A Timer to check for new messages every 10 seconds.
    Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        Provider.of<MessagesProvider>(context, listen: false)
            .getMessages(token: token!);
      },
    );
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Temp Mail"),
        actions: [
          IconButton(
            onPressed: () {
              /// Remove token and logout
              Provider.of<TokenProvider>(context, listen: false).cleanToken();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: mainColor.withOpacity(0.18),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 1),

            /// ====================== Top Bar with user Email
            Consumer<AccountProvider>(builder: (context, account, child) {
              return TopBar(
                screenSize: screenSize,
                title: account.account.address.toString(),
              );
            }),
            const SizedBox(height: 10),

            /// ============================ Messages Title
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

            /// ============================ Messages List
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

                      /// ================ Your Messages
                      itemBuilder: (context, index) {
                        return MessageBox(
                          screenSize: screenSize,
                          from:
                              "${messages.messages[index].from?.name} <${messages.messages[index].from?.address}>",
                          to: messages.messages[index].to!,
                          time: "${messages.messages[index].createdAt}",
                          subject: "${messages.messages[index].subject}",
                          details: "${messages.messages[index].intro}",
                        );
                      },
                    );

                    /// ============== Messages Loading Indicator
                  } else {
                    return const CircularProgressIndicator();
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
