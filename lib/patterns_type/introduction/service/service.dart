import 'dart:convert';

import 'package:architecture_patterns/logService/logger.dart';
import 'package:architecture_patterns/patterns_type/introduction/model/account.dart';
import 'package:http/http.dart';

class ServiceData{
  static String BASE = "api.github.com";
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */

  static String API_LIST = "/users/Alisher19121994";

  static Future<String?> GETs(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      LogService.d(response.body);
      return response.body;
    }
    return null;
  }
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static List<Account> parsePostList(String response){
    dynamic json = jsonDecode(response);
    var data = List<Account>.from(json.map((x) => Account.fromJson(x)));
    return data;
  }
}