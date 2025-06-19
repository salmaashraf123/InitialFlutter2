import 'package:flutter/material.dart';
import 'package:projects/View/ThemeData/Theme.dart';
import 'WelcomePage.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      theme: GetTheme(),
    );
  }
}