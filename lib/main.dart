import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(LuckyBiteApp());
}

class LuckyBiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LuckyBite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: WelcomeScreen(),
    );
  }
}
