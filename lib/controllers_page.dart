import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/utils.dart';

import 'controllers_generator.dart';
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
      body: ControllersGen(
        elements: widget.controllersList.elements,
        messageSender: widget.messageSender,
      ),
    );
  }
}
