import 'package:flutter/material.dart';
import 'package:mocktail_test/features/home/controller.dart';
import 'package:mocktail_test/features/repositories/shared_preferences.dart';

import 'features/home/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences = SharedPreferences();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: 'Flutter Demo Home Page',
        controller: HomeController(sharedPreferences),
      ),
    );
  }
}
