import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../client/message_sender.dart';

class TextWithWrap extends StatefulWidget {
  final MessageSender messageSender;
  final String tag;
  final String initialValue;

  const TextWithWrap(
      {super.key,
      required this.messageSender,
      required this.tag,
      required this.initialValue});

  @override
  State<TextWithWrap> createState() => _TextWithWrapState();
}

class _TextWithWrapState extends State<TextWithWrap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Text: ${widget.tag}',
          ),
          Text(
            widget.initialValue,
          ),
          Container(
            height: 10,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
