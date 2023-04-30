import 'package:flutter/cupertino.dart';
import 'package:sovteh/slider_with_wrap.dart';
import 'package:sovteh/toggle_with_wrap.dart';
import 'package:sovteh/utils.dart';

import 'message_sender.dart';

class ControllersGen extends StatelessWidget {
  final List<ControllerUnit> elements;
  final MessageSender messageSender;

  const ControllersGen(
      {super.key, required this.elements, required this.messageSender});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: elements.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            height: 10,
          );
        } else {
          ControllerUnit controllerUnit = elements[index - 1];
          if (controllerUnit.controllerType == ControllerType.toggle) {
            return ToggleWithWrap(
              messageSender: messageSender,
              tag: controllerUnit.tag,
              initialValue: controllerUnit.initialValue,
            );
          } else {
            return SliderWithWrap(
              messageSender: messageSender,
              tag: controllerUnit.tag,
              initialValue: controllerUnit.initialValue,
            );
          }
        }
      },
    );
  }
}
