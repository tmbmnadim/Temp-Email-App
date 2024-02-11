import 'package:flutter/material.dart';
import 'package:tempemailsystemqtec/consts.dart';
import 'custom_widgets.dart';

/// This is the bar under the navbar. I named it TopBar.

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
    required this.screenSize,
    required this.title,
  });
  final Size screenSize;
  final String title;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const TopBoxClipper(),
      child: Container(
        color: mainColor,
        height: widget.screenSize.height * 0.1,
        width: widget.screenSize.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: widget.screenSize.width,
            height: widget.screenSize.height * 0.5,
            child: Text(
              widget.title,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
