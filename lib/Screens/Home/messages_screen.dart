import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempemailsystemqtec/Custom%20Widgets/message_box.dart';
import 'package:tempemailsystemqtec/Custom%20Widgets/top_bar.dart';
import 'package:tempemailsystemqtec/consts.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {

  @override
  void initState() {
    Provider.of<MessagesProvider>(context)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Temp Mail"),
      ),
      backgroundColor: mainColor.withOpacity(0.18),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 1),
            TopBar(
              screenSize: screenSize,
              title: "example@email.com",
            ),
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
              child: Column(
                children: [
                  MessageBox(
                    screenSize: screenSize,
                    from: "User Name <example@email.com>",
                    to: "User Name <example@email.com>",
                    time: "Time Frame",
                    subject: "Subject of email",
                    details: "Email body",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
