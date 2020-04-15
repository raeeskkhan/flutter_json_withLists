import 'package:flutter/material.dart';
import 'JsonParsingMapSimple.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "JSON PARSING MAP SIMPLE",
      home: JsonParsingMapSimple(),
    );
  }
}
