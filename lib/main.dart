import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/message_sender.dart';
import 'package:sovteh/request_page.dart';
import 'package:sovteh/slider_with_wrap.dart';

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
            SliderWithWrap(
              messageSender: widget.messageSender,
              tag: "FIRST",
            ),
            SliderWithWrap(
              messageSender: widget.messageSender,
              tag: "SECOND",
            ),
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
          // openRequestPage(currentSliderValue);
        },
        child: const Icon(Icons.search),
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

  void openRequestPage(double currentSliderValue) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => RequestPage(
                  urlCode: currentSliderValue.round(),
                  urlStr: _getSiteName(currentSliderValue.round()),
                  messageSender: widget.messageSender,
                )));
  }

  String _getSiteName(int x) {
    var urlStr = 'ya.ru';
    switch (x) {
      case 0:
        urlStr = 'google.com';
        break;
      case 20:
        urlStr = 'stackoverflow.com';
        break;
      case 40:
        urlStr = 'new.fml31.ru';
        break;
      case 60:
        urlStr = '192.168.0.103:5000';
        break;
      case 80:
        urlStr = 'vk.ru';
        break;
    }
    return urlStr;
  }
}
