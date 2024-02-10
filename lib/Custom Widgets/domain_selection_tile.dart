import 'package:flutter/material.dart';

import '../consts.dart';

class DomainSelectionTile extends StatefulWidget {
  const DomainSelectionTile({
    super.key,
    required this.domain,
    required this.onTap,
  });

  final String domain;
  final Function() onTap;

  @override
  State<DomainSelectionTile> createState() => _DomainSelectionTileState();
}

class _DomainSelectionTileState extends State<DomainSelectionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: widget.onTap,
          leading: Icon(
            Icons.mail,
            color: mainColor,
          ),
          title: Text(
            widget.domain,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
