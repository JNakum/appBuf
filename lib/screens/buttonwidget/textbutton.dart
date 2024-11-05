import 'package:flutter/material.dart';

class Textbutton extends StatefulWidget {
  const Textbutton({super.key});

  @override
  _TextbuttonState createState() => _TextbuttonState();
}

class _TextbuttonState extends State<Textbutton> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text("Text Button"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.03,
                          )),
                      child: const Text("Click Me...!"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
