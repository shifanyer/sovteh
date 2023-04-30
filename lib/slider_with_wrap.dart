import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/utils.dart';

import 'message_sender.dart';

class SliderWithWrap extends StatefulWidget {
  final MessageSender messageSender;
  final String tag;

  const SliderWithWrap(
      {super.key, required this.messageSender, required this.tag});

  @override
  State<SliderWithWrap> createState() => _SliderWithWrapState();
}

class _SliderWithWrapState extends State<SliderWithWrap> {
  StreamController<MessageData> streamController = StreamController();
  double currentSliderValue = 2;

  @override
  void initState() {
    super.initState();
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
          const Text(
            'Slider:',
          ),
          Slider(
            value: currentSliderValue,
            max: 100,
            divisions: 10000,
            label: getHundredths(currentSliderValue).toString(),
            onChanged: (double value) {
              streamController
                  .add(MessageData(getHundredths(value), widget.tag));
              setState(() {
                currentSliderValue = value;
              });
            },
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
