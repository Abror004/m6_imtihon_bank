import 'dart:convert';
import 'package:http/http.dart';

import '../models/post_model.dart';

class Network {
  static bool isTester = true;

  static String SERVER_DEVELOPMENT = "622ac5d014ccb950d224e6fe.mockapi.io";
  static String SERVER_PRODUCTION = "622ac5d014ccb950d224e6fe.mockapi.io";

  static Map<String, String> getHeaders() {
    Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};
    return headers;
  }

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(getServer(), api, params); // http or https
    var response = await get(uri, headers: getHeaders());
    // Log.d(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(getServer(), api); // http or https
    var response = await post(uri, headers: getHeaders(), body: jsonEncode(params));
    // Log.d(response.body);

    if (response.statusCode == 200 || response.statusCode == 201)
      return response.body;
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(getServer(), api, params); // http or https
    var response = await delete(uri, headers: getHeaders());
    // Log.d(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }

  /* Http Apis */
  static String API_LIST = "/m6imtihon/posts";
  static String API_CREATE = "/m6imtihon/posts";//{id}
  static String API_DELETE = "/m6imtihon/posts"; //{id}

  /* Http Params */
  static Map<String, dynamic> paramsEmpty() {
    Map<String, dynamic> params = {};
    return params;
  }

  static Map<String, dynamic> paramsCreate(Post post) {
    Map<String, dynamic> params = {};
    params.addAll({
      "id": post.id,
      "card_number": post.card_number,
      "date": post.date,
      "name": post.name,
      "surname": post.surname,
      "cvv_number": post.cvv_number,
    });
    return params;
  }
}