import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/slider_with_wrap.dart';
import 'package:sovteh/toggle_with_wrap.dart';
import 'package:sovteh/utils.dart';

import 'message_sender.dart';

class ControllersPage extends StatefulWidget {
  final ControllersList controllersList;
  final MessageSender messageSender;

  const ControllersPage({
    super.key,
    required this.controllersList,
    required this.messageSender,
  });

  @override
  State<ControllersPage> createState() => _ControllersPageState();
}

class _ControllersPageState extends State<ControllersPage> {
  var code = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        body: ListView.builder(
          itemCount: widget.controllersList.elements.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 10,
              );
            } else {
              ControllerUnit controllerUnit =
                  widget.controllersList.elements[index - 1];
              if (controllerUnit.controllerType == ControllerType.toggle) {
                return ToggleWithWrap(
                  messageSender: widget.messageSender,
                  tag: controllerUnit.tag,
                  initialValue: controllerUnit.initialValue,
                );
              } else {
                return SliderWithWrap(
                  messageSender: widget.messageSender,
                  tag: controllerUnit.tag,
                  initialValue: controllerUnit.initialValue,
                );
              }
            }
          },
        ));
  }
}
