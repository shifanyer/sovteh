import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/utils.dart';

import '../client/message_sender.dart';

class SliderWithWrap extends StatefulWidget {
  final MessageSender messageSender;
  final String tag;
  final double initialValue;

  const SliderWithWrap(
      {super.key,
      required this.messageSender,
      required this.tag,
      required this.initialValue});

  @override
  State<SliderWithWrap> createState() => _SliderWithWrapState();
}

class _SliderWithWrapState extends State<SliderWithWrap> {
  StreamController<MessageData> streamController = StreamController();
  late double currentSliderValue;

  @override
  void initState() {
    super.initState();
    currentSliderValue = widget.initialValue;
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
            'Slider: ${widget.tag}',
          ),
          Slider(
            value: currentSliderValue,
            max: 100,
            divisions: 100,
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
