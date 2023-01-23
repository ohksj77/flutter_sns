import 'package:flutter/material.dart';
import 'package:sns_flutter/src/screen/home.dart';
import 'package:sns_flutter/src/screen/user/register.dart';

class MyApp extends StatelessWidget {
  String? token;
  MyApp(this.token, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: token == null ? Register() : Home(),
    );
  }
}
