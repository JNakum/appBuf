import 'package:appbuf/screens/customDialog/dialogutils.dart';
import 'package:flutter/material.dart';

class Elevatedbutton extends StatefulWidget {
  const Elevatedbutton({super.key});

  @override
  _ElevatedbuttonState createState() => _ElevatedbuttonState();
}

class _ElevatedbuttonState extends State<Elevatedbutton> {
  // onFocusChange property ka use focusNode se
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print(" Button Focus Onnnn... ");
      } else {
        print(" Button Focus Offfff... ");
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Using Media Query
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 191, 0), // Set background color,
      appBar: AppBar(
        title: const Text("ElevatedButton"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              // First Row with two buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                      child: const Text("Button onPressed properties.."),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.03),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Expanded(
child: ElevatedButton(
onPressed: () {
_showBottomSheet(context);
},
child: const Text("Button onPressed properties.."),
),
),

''');
                    },
                    child: const Icon(Icons.info),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.02), // Space between rows

              // Second Row with two buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onLongPress: () {
                        _showBottomSheet(context);
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Button Pressed!")));
                        },
                        child: const Text("GestureDetector onLongPress "),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.03,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Expanded(
child: GestureDetector(
onLongPress: () {
_showBottomSheet(context);
},
child: ElevatedButton(
onPressed: () {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text("Button Pressed!")));
},
child: const Text("GestureDetector onLongPress "),
),
),
),
''');
                    },
                    child: const Icon(
                      Icons.info,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.02), // Space between rows

              // Third Row with two buttons
              Row(
                children: [
                  Focus(
                    focusNode: _focusNode,
                    onFocusChange: (hasFocus) {
                      if (hasFocus) {
                        print("First Button ko focus mila");
                      } else {
                        print("First Button ne focus lose kiya");
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        print("Focus On button111 onFocusChange");
                      },
                      child: Text("Focus On button111 onFocusChange"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.03,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: ElevatedButton(
                      focusNode: _focusNode,
                      onPressed: () {
                        print("Button Pressed.");
                      },
                      child: Text("Focus On."),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.03,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Focus(
focusNode: _focusNode,
onFocusChange: (hasFocus) {
if (hasFocus) {
print("First Button ko focus mila");
} else {
print("First Button ne focus lose kiya");
}
},
child: ElevatedButton(
onPressed: () {
print("Focus On button111 onFocusChange");
},
child: Text("Focus On button111 onFocusChange"),
),
),
Expanded(
child: ElevatedButton(
focusNode: _focusNode,
onPressed: () {
print("Button Pressed.");
},
child: const Text("Focus On."),
),
),
''');
                    },
                    child: const Icon(Icons.info),
                  ),
                ],
              ),
              // Add more rows as needed

              SizedBox(
                height: screenHeight * 0.02,
              ),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: screenHeight * 0.07,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 212, 33, 243),
                            foregroundColor: Colors.black,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            // padding: const EdgeInsets.symmetric(vertical: 5),
                            side: const BorderSide(
                              width: 5,
                              color: Colors.green,
                            )),
                        child: const Text("Styled Button Pressed!"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Expanded(
child: Container(
width: double.infinity,
height: 60,
child: ElevatedButton(
onPressed: () {},
style: ElevatedButton.styleFrom(
backgroundColor:
const Color.fromARGB(255, 212, 33, 243),
foregroundColor: Colors.black,
elevation: 5,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(30),
),
// padding: const EdgeInsets.symmetric(vertical: 5),
side: const BorderSide(
width: 5,
color: Colors.green,
)),
child: const Text("Styled Button Pressed!"),
),
),
),
''');
                    },
                    child: const Icon(Icons.info),
                  ),
                ],
              ),

              SizedBox(
                height: screenHeight * 0.02,
              ),

              Row(
                children: [
                  Flexible(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          autofocus: true,
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                            ),
                          ),
                          child: const Text(" Material Use Button 1"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Flexible(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02),
                          ),
                          child: const Text("Material Use Button 2"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Flexible(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                            ),
                          ),
                          child: const Text("Material Use Button 3"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Flexible(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                            ),
                          ),
                          child: const Text("Material Use Button 4"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Flexible(
child: Material(
elevation: 4,
borderRadius: BorderRadius.circular(20),
child: Container(
decoration: BoxDecoration(
color: Colors.blue,
borderRadius: BorderRadius.circular(20)),
child: ElevatedButton(
autofocus: true,
onPressed: () {},
style: ElevatedButton.styleFrom(
backgroundColor: Colors.transparent,
foregroundColor: Colors.white,
elevation: 0,
),
child: const Text(" Material Use Button 1"),
),
),
),
),
const SizedBox(
width: 5,
),
**********************************
Add More 3 Button an some code.. And Other 3 Button autofocus: false,
**********************************

''');
                    },
                    child: const Icon(Icons.info),
                  ),
                ],
              ),

              SizedBox(
                height: screenHeight * 0.02,
              ),

              Row(
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Click Me!.."),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                          vertical: screenHeight * 0.05,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: SizedBox(
          height: 200,
          child: Center(
            child: Text(
              "Button Clicked!",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
    },
  );
}
