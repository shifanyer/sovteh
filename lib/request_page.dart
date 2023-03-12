import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message_sender.dart';

class RequestPage extends StatefulWidget {
  final int urlCode;
  final String urlStr;
  final MessageSender messageSender;

  const RequestPage(
      {super.key,
      required this.urlCode,
      required this.urlStr,
      required this.messageSender});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  var code = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: FutureBuilder(
        future: widget.messageSender.loadCode(widget.urlStr),
        builder: (context, snapshot) {
          return Center(
            child: (snapshot.data != null)
                ? SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data?.site ?? ""),
                        Text(
                          snapshot.data?.code.toString() ?? "500",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
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
}
