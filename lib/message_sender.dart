import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:sovteh/site_data.dart';

class MessageSender {

  String serverUrl = "193.168.0.103:5000";

  void updUrl(String newUrl) {
    serverUrl = newUrl;
  }

  Future<SiteData> loadCode(String urlStr) async {
    var result = 404;
    try {
      var url = Uri.http(urlStr);
      var response =
          await http.get(url).timeout(const Duration(milliseconds: 300));
      result = response.statusCode;
    } catch (_) {}
    return SiteData(urlStr, result);
  }

  Future sendDigitToServer(double digit) async {
    http
        .get(Uri.http(serverUrl, "/numbers/$digit"))
        .timeout(const Duration(milliseconds: 300));
  }
}
