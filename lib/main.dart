import 'package:codigo3_api/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ApiApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
