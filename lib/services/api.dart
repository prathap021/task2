// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

String username = '';
String password = '';

// String basicAuth = 'Basic ' + base64.encode(utf8.encode('$username:$password'));
// var headers = {'Authorization': basicAuth, 'Content-Type': 'application/json'};

// String username = 'alex03';
// String password = 'alexbca';

Future<void> fetchdata() async {
  String basicAuth =
      'Basic ' + base64.encode(utf8.encode('$username:$password'));
  var headers = {
    'Authorization': basicAuth,
    'Content-Type': 'application/json'
  };
  var request = http.Request(
      'POST', Uri.parse('http://18.136.144.240:8080/api/v2.0/members/signin'));
  request.body = json.encode({
    "requestType": "MEMBER",
    "deviceId": "string",
    "deviceType": "ANDROID",
    "deviceToken": "string",
    "location": {
      "type": "Point",
      "coordinates": [80.25934953737513, 13.029071455550344]
    }
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    debugPrint(response.statusCode.toString());
    // debugPrint(await response.stream.bytesToString());
    Get.toNamed("/second");
    // Map<String, dynamic> res = json.decode(response.stream.toString());
    // debugPrint(res['token']);
  } else {
    debugPrint(response.reasonPhrase);
  }
}

// Future<void> fetchdata() async {
//   var response = await http.post(
//       Uri.parse('http://18.136.144.240:8080/api/v2.0/members/signin'),
//       body: {
//         jsonEncode({
//           "requestType": "MEMBER",
//           "deviceId": "string",
//           "deviceType": "ANDROID",
//           "deviceToken": "string",
//           "location": {
//             "type": "Point",
//             "coordinates": [80.25934953737513, 13.029071455550344]
//           }
//         })
//       },
//       headers: headers);
//   debugPrint(response.statusCode.toString());
// }
