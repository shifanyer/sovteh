import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sovteh/request_page.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double currentSliderValue = 20;

  void openRequestPage(double currentSliderValue) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => RequestPage(
                  urlCode: currentSliderValue.round(),
                  urlStr: _getSiteName(currentSliderValue.round()),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Slider:',
            ),
            Slider(
              value: currentSliderValue,
              max: 100,
              divisions: 5,
              label: _getSiteName(currentSliderValue.round()),
              onChanged: (double value) {
                setState(() {
                  currentSliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openRequestPage(currentSliderValue);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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
        urlStr = 'abracadabrabro.com';
        break;
      case 80:
        urlStr = 'vk.ru';
        break;
    }
    return urlStr;
  }
}
