import 'package:appbuf/screens/homescreen/splashscreen.dart';
import 'package:flutter/material.dart';
// import 'screens/homescreen.dart'; // Pehle yeh home_screen.dart tha, ab homescreen.dart hai

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBuf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.pinkAccent,
        ),
      ),
      home: const Splashscreen(), // HomeScreen ko call kar rahe hain
    );
  }
}
