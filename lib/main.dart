// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sample/screens/description.dart';

import 'package:sample/view/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: Login(),
      getPages: [
        GetPage(name: '/', page: () => Desc()),
        // GetPage(name: '/second', page: () => Description()),
      ],
    );
  }
}
