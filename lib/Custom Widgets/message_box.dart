import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/Models/messages_model.dart';
import '../consts.dart';

/// This is the widget that represents the email.

class MessageBox extends StatefulWidget {
  const MessageBox({
    super.key,
    required this.screenSize,
    required this.from,
    required this.to,
    required this.time,
    required this.subject,
    required this.details,
  });

  final Size screenSize;
  final String from;
  final List<To> to;
  final String time;
  final String subject;
  final String details;

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            /// ------------ FROM TITLE
            SizedBox(
              width: widget.screenSize.width * 0.8,
              child: Text(
                "From: ",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: widget.screenSize.width * 0.8,
              child: Text(
                widget.from,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),

            /// ------------ TO TITLE
            SizedBox(
              width: widget.screenSize.width * 0.8,
              child: Text(
                "To: ",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.to.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: widget.screenSize.width * 0.8,
                    child: Text(
                      "${widget.to[index].name} <${widget.to[index].address}>",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  );
                }),

            /// ------------ TIME TITLE
            SizedBox(
              width: widget.screenSize.width * 0.8,
              child: Text(
                "Time: ",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: widget.screenSize.width * 0.8,
              child: Text(
                widget.time,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),

            /// ------------ SUBJECT TITLE
            SizedBox(
              width: widget.screenSize.width * 0.8,
              child: Text(
                "Subject: ",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),

            SizedBox(
              width: widget.screenSize.width * 0.8,
              child: Text(
                widget.subject,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),

            /// ------------ BODY TITLE
            SizedBox(
              width: widget.screenSize.width * 0.8,
              child: Text(
                "Details: ",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: widget.screenSize.width * 0.8,
              child: Text(
                widget.details,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
