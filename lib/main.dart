import 'package:flutter/material.dart';
import 'package:tacaro/scanner.dart';
import 'package:tacaro/splash_screen.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenScanner(),
    );
  }
}
