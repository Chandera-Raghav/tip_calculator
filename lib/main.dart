import 'package:flutter/material.dart';
import 'package:tip_calculater/flash_screen_app_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => _MainAppScreen();
}
class _MainAppScreen extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FlashScreenPage(),
    );
  }
}
