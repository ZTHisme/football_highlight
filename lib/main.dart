import 'package:flutter/material.dart';
import 'package:football_highlight/page/json_array.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JsonArrayEx();
  }
}
