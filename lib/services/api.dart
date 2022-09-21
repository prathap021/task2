import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sample/services/descriptionapi.dart';

dynamic list = [];
dynamic result = list['bearerToken'];

String username = '';
String password = '';

String basicAuth = 'Basic ' + base64.encode(utf8.encode('$username:$password'));

Future<void> postdata() async {
  final response = await http.post(
    Uri.parse('http://18.136.144.240:8080/api/v2.0/members/signin'),
    headers: <String, String>{
      'Authorization': basicAuth,
      'Content-Type': 'application/json'
    },
    body: jsonEncode(<String, dynamic>{
      "requestType": "MEMBER",
      "deviceId": "string",
      "deviceType": "ANDROID",
      "deviceToken": "string",
      "location": {
        "type": "Point",
        "coordinates": [80.25934953737513, 13.029071455550344]
      }
    }),
  );

  if (response.statusCode == 200) {
    list = jsonDecode(response.body);
    getAll();
  } else {
    throw Exception('Response failed');
  }
}
