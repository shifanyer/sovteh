import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/utils.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'message_sender.dart';

class ToggleWithWrap extends StatefulWidget {
  final MessageSender messageSender;
  final String tag;
  final int initialValue;

  const ToggleWithWrap(
      {super.key,
      required this.messageSender,
      required this.tag,
      required this.initialValue});

  @override
  State<ToggleWithWrap> createState() => _ToggleWithWrapState();
}

class _ToggleWithWrapState extends State<ToggleWithWrap> {
  StreamController<MessageData> streamController = StreamController();
  late int currentToggleValue;

  @override
  void initState() {
    super.initState();
    currentToggleValue = widget.initialValue;
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
    return Center(
      child: Column(
        children: [
          Text(
            'Toggle: ${widget.tag}',
          ),
          Container(
            height: 10,
          ),
          ToggleSwitch(
            minWidth: 90.0,
            cornerRadius: 20.0,
            activeBgColors: [
              [Colors.green[800]!],
              [Colors.red[800]!]
            ],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            initialLabelIndex: widget.initialValue,
            totalSwitches: 2,
            labels: ['True', 'False'],
            radiusStyle: true,
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
    streamController.close(); //Streams must be closed when not needed
    super.dispose();
  }

  double getHundredths(double x) {
    return (x * 100).truncate() / 100;
  }
}
