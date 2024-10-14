import 'package:flutter/material.dart';

class Textbutton extends StatefulWidget {
  const Textbutton({super.key});

  @override
  _TextbuttonState createState() => _TextbuttonState();
}

class _TextbuttonState extends State<Textbutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Button"),
      ),
    );
  }
}
