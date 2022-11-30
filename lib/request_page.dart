import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestPage extends StatefulWidget {
  final int urlCode;
  final String urlStr;

  const RequestPage({super.key, required this.urlCode, required this.urlStr});

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
        future: _loadCode(widget.urlStr),
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

  Future<SiteData> _loadCode(String urlStr) async {
    var result = 404;
    try {
      var url = Uri.http(urlStr);
      var response = await http.get(url).timeout(const Duration(seconds: 5));
      result = response.statusCode;
    } catch (_) {}
    return SiteData(urlStr, result);
  }
}

class SiteData {
  String site;
  int code;

  SiteData(this.site, this.code);
}
