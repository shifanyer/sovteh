import 'package:flutter/cupertino.dart';
import 'package:sovteh/elements_with_wrap/slider_with_wrap.dart';
import 'package:sovteh/elements_with_wrap/toggle_with_wrap.dart';
import 'package:sovteh/utils.dart';

import 'elements_with_wrap/button_with_wrap.dart';
import 'client/message_sender.dart';
import 'elements_with_wrap/text_with_wrap.dart';

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
          switch (controllerUnit.controllerType) {
            case ControllerType.TOGGLE:
              return ToggleWithWrap(
                messageSender: messageSender,
                tag: controllerUnit.tag,
                initialValue: controllerUnit.initialValue,
              );
            case ControllerType.SLIDER:
              return SliderWithWrap(
                messageSender: messageSender,
                tag: controllerUnit.tag,
                initialValue: controllerUnit.initialValue,
              );
            case ControllerType.TEXT:
              return TextWithWrap(
                messageSender: messageSender,
                tag: controllerUnit.tag,
                initialValue: controllerUnit.initialValue,
              );
            case ControllerType.BUTTON:
              return ButtonWithWrap(
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
