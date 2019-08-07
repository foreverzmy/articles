import 'package:flutter/material.dart';
import './views/welcome/splash.dart';
import './views/home/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "文巢",
      theme: new ThemeData(primarySwatch: Colors.orange),
      home: Splash(),
      routes: {'/HomePage': (context) => HomePage()},
    );
  }
}
