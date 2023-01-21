import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:sovteh/site_data.dart';

String serverUrl = "192.168.0.103:5000";

class MessageSender {
  static Future<SiteData> loadCode(String urlStr) async {
    var result = 404;
    try {
      var url = Uri.http(urlStr);
      var response =
          await http.get(url).timeout(const Duration(milliseconds: 300));
      result = response.statusCode;
    } catch (_) {}
    return SiteData(urlStr, result);
  }

  static Future sendDigitToServer(double digit) async {
    http
        .get(Uri.http(serverUrl, "/numbers/$digit"))
        .timeout(const Duration(milliseconds: 300));
  }
}
