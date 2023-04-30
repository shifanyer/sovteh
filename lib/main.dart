import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/client/message_sender.dart';

import 'controllers_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        messageSender: MessageSender(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title, required this.messageSender});

  final String title;
  final MessageSender messageSender;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double currentSliderValue = 2;

  // StreamController<double> streamController = StreamController();
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    _textController.text = "192.168.0.103:5000";
    // streamController.stream.listen((double data) {
    //   widget.messageSender.sendDigitToServer(data);
    // }, onDone: () {
    //   print("Task Done");
    // }, onError: (error) {
    //   print("Some Error");
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sovteh")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SliderWithWrap(
            //   messageSender: widget.messageSender,
            //   tag: "FIRST",
            //   initialValue: 90,
            // ),
            // SliderWithWrap(
            //   messageSender: widget.messageSender,
            //   tag: "SECOND",
            //   initialValue: 10,
            // ),
            // const Text(
            //   'Slider:',
            // ),
            // Slider(
            //   value: currentSliderValue,
            //   max: 100,
            //   divisions: 10000,
            //   label: getHundredths(currentSliderValue).toString(),
            //   onChanged: (double value) {
            //     streamController.add(getHundredths(value));
            //     setState(() {
            //       currentSliderValue = value;
            //     });
            //   },
            // ),
            // Container(
            //   height: 10,
            // ),
            Container(
              alignment: Alignment.topCenter,
              width: 200,
              child: TextField(
                controller: _textController,
                onSubmitted: (String value) {
                  widget.messageSender.updUrl(value);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openRequestPage(currentSliderValue, widget.messageSender);
        },
        child: const Icon(Icons.arrow_circle_right_outlined),
      ),
    );
  }

  @override
  void dispose() {
    // streamController.close(); //Streams must be closed when not needed
    _textController.dispose();
    super.dispose();
  }

  double getHundredths(double x) {
    return (x * 100).truncate() / 100;
  }

  void openRequestPage(double currentSliderValue, MessageSender messageSender) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ControllersPage(
                  // controllersList: ControllersList([
                  //   ControllerSlider(0.0, "FIRST"),
                  //   ControllerSlider(20.0, "SECOND"),
                  //   ControllerSlider(40.0, "THIRD"),
                  //   ControllerToggle(1, "FOURTH"),
                  //   ControllerToggle(0, "FIFTH"),
                  //   ControllerSlider(40.0, "SIXTH"),
                  //   ControllerSlider(40.0, "THIRD"),
                  //   ControllerToggle(1, "FOURTH"),
                  //   ControllerToggle(0, "FIFTH"),
                  //   ControllerSlider(40.0, "SIXTH"),
                  //   ControllerSlider(40.0, "THIRD"),
                  //   ControllerToggle(1, "FOURTH"),
                  //   ControllerToggle(0, "FIFTH"),
                  //   ControllerSlider(40.0, "SIXTH"),
                  //   ControllerSlider(40.0, "THIRD"),
                  //   ControllerToggle(1, "FOURTH"),
                  //   ControllerToggle(0, "FIFTH"),
                  //   ControllerSlider(40.0, "SIXTH"),
                  // ]),
                  messageSender: messageSender,
                )));
  }
}
