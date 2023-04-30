import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/utils.dart';

import '../client/message_sender.dart';

class ButtonWithWrap extends StatefulWidget {
  final MessageSender messageSender;
  final String tag;
  final int initialValue;

  const ButtonWithWrap(
      {super.key,
      required this.messageSender,
      required this.tag,
      required this.initialValue});

  @override
  State<ButtonWithWrap> createState() => _ButtonWithWrapState();
}

class _ButtonWithWrapState extends State<ButtonWithWrap> {
  StreamController<MessageData> streamController = StreamController();
  late int currentButtonValue;

  @override
  void initState() {
    super.initState();
    currentButtonValue = widget.initialValue;
    streamController.stream.listen((MessageData data) {
      widget.messageSender.sendDigitToServer(data);
    }, onDone: () {
      print("Task Done");
    }, onError: (error) {
      print("Some Error");
    });
  }

  @override
  Widget build(BuildContext context) {
    int buttonValue = currentButtonValue;
    return Center(
      child: Column(
        children: [
          Text(
            'Button: ${widget.tag}',
          ),
          Container(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () {
                if (currentButtonValue == 1) {
                  buttonValue = 0;
                } else {
                  buttonValue = 1;
                }
                var messageData = MessageData(buttonValue * 1.0, widget.tag);
                streamController.add(messageData);
                setState(() {
                  currentButtonValue = buttonValue;
                });
              },
              child: const Text('Enabled Button')),
          Container(
            height: 10,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close(); //Streams must be closed when not needed
    super.dispose();
  }
}
