import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:sample/model/desmodel.dart';
import 'package:sample/services/api.dart';

Future<List<Result>> getAll() async {
  var data = await http.get(
      Uri.parse(
          'http://18.136.144.240:8080/api/v2.0/listings?type=PRODUCT&latitude=11.7478164&size=20&page=0&longitude=79.761892&language=en&maxDistance=10000.0'),
      headers: <String, String>{
        'Authorization': 'Bearer $result',
        'Content-Type': 'application/json'
      });
  if (data.statusCode == 200) {
    debugPrint(data.statusCode.toString());
    var jsondata = jsonDecode(data.body);
    var listed = jsondata['data'];
    debugPrint(listed.toString());
    List<Result> users = [];

    for (var u in listed) {
      Result res = Result(u['title'], u['price'], u['currency']);
      users.add(res);
      debugPrint(users.length.toString());
      Get.toNamed("/Desc");
    }
    return users;
  } else {
    throw Exception('failed load data');
  }
}
