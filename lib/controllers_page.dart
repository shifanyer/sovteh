import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/utils.dart';

import 'client/model.dart';
import 'controllers_generator.dart';
import 'client/message_sender.dart';

class ControllersPage extends StatefulWidget {
  // final ControllersList controllersList;
  final MessageSender messageSender;

  const ControllersPage({
    super.key,
    // required this.controllersList,
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
      body: FutureBuilder(
        future: widget.messageSender.getControllers(),
        builder: (context, snapshot) {
          return Center(
            child: (snapshot.data != null)
                ? SafeArea(
                    child: ControllersGen(
                      elements: mapModelListToUnitList(snapshot.data!),
                      messageSender: widget.messageSender,
                    ),
                  )
                : const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
          );
        },
      ),
    );
  }

  List<ControllerUnit> mapModelListToUnitList(
      List<ControllerModel> modelsList) {
    List<ControllerUnit> res =
        modelsList.map((e) => mapModelToUnit(e)).toList();
    return res;
  }

  ControllerUnit mapModelToUnit(ControllerModel m) {
    switch (m.type) {
      case ControllerType.TOGGLE:
        return ControllerToggle(initialValue: 0, tag: m.name);
      case ControllerType.SLIDER:
        return ControllerSlider(initialValue: 0.0, tag: m.name);
      case ControllerType.TEXT:
        return ControllerText(initialValue: m.text, tag: m.name);
      case ControllerType.BUTTON:
        return ControllerButton(initialValue: 0, tag: m.name);
    }
  }
}
