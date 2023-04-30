import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sovteh/site_data.dart';
import 'package:sovteh/utils.dart';

import 'model.dart';

class MessageSender {
  String serverUrl = "192.168.0.103:5000";

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

  Future sendDigitToServer(MessageData data) async {
    http
        .get(Uri.http(serverUrl, "/arguments",
            {"n": data.value.toString(), "tag": data.tag}))
        .timeout(const Duration(milliseconds: 300));
  }

  Future<List<ControllerModel>> getControllers() async {
    var response = await http
        .get(Uri.http(serverUrl, "/"))
        .timeout(const Duration(milliseconds: 300));
    var body = response.body;
    List parsedList = json.decode(body);
    List<ControllerModel> listRes =
        parsedList.map((val) => ControllerModel.fromJson(val)).toList();
    return listRes;
  }
}
