import 'package:flutter/material.dart';

class Textwidget extends StatefulWidget {
  const Textwidget({super.key});

  @override
  _Textwidget createState() => _Textwidget();
}

class _Textwidget extends State<Textwidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start just outside right
      end: const Offset(-1.0, 0.0), // End just outside left
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation immediately on screen load
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free resources
    super.dispose();
  }

  void _showTextProperties(String textProperties) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Text Properties"),
          content: Text(
            textProperties,
            style: const TextStyle(color: Color.fromARGB(255, 41, 154, 0)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text Widget",
          style: TextStyle(fontFamily: "FontMain"),
        ),
      ),
      body: Container(
        color: Colors.lightGreen,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Adjust column size to its content
              children: [
                // Row 1 with background color, border radius, and spacing
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.shade100, // Background color
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  padding: const EdgeInsets.all(8), // Inner padding
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Text Widgets...!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          wordSpacing: 5,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                            Text(
                              "Text Widgets...!",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                wordSpacing: 5,
                                letterSpacing: 2,
                              ),
                            ),
                          ''');
                        },
                        child: const Icon(
                          Icons.info,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10), // Gap between rows

                // Row 2
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Flexible(
                        child: Text(
                          'Text Widgets Max Line 2 Yeh text do line mein truncate hoga agar zyada lamba hai  Yeh text do line mein truncate hoga agar zyada lamba hai',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                            Text(
                              'Text Widgets Max Line 2',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ''');
                        },
                        child: const Icon(
                          Icons.info,
                          color: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10), // Gap between rows

                // Row 3
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Text Show In (Right To Left...!)',
                        textDirection: TextDirection.rtl,
                        softWrap: true,
                        textScaler: TextScaler.linear(1.5),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                            Text(
                              'Text Show In (Right To Left...!) Demo',
                              textDirection: TextDirection.rtl,
                              softWrap: true,
                              textScaler: TextScaler.linear(1.5),
                            ),
                          ''');
                        },
                        child: const Icon(
                          Icons.info,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10), // Gap between rows

                // Row 4
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'This is a long text',
                        textWidthBasis: TextWidthBasis.longestLine,
                        style: TextStyle(fontSize: 28),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                            Text(
                              'This is a long text',
                              textWidthBasis: TextWidthBasis.longestLine,
                              style: TextStyle(fontSize: 28),
                            ),
                          ''');
                        },
                        child: const Icon(
                          Icons.info,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10), // Gap between rows

                // Row 5
                Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'StrutStyle Example ...',
                        strutStyle: StrutStyle(height: 5),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                            Text(
                              'Yeh ek example hai',
                              strutStyle: StrutStyle(height: 5),
                            ),
                          ''');
                        },
                        child: const Icon(
                          Icons.info,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10), // Gap between rows

                // Row 6
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Hello",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                                text: " Rich",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 28)),
                            TextSpan(
                                text: " Text",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 30)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                            RichText(
                              text: const TextSpan(
                                text: "Hello",
                                style: TextStyle(color: Colors.red, fontSize: 20),
                                children: [
                                  TextSpan(
                                    text: " Rich",
                                    style: TextStyle(color: Colors.blue, fontSize: 28),
                                  ),
                                  TextSpan(
                                    text: " Text",
                                    style: TextStyle(color: Colors.green, fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                          ''');
                        },
                        child: const Icon(
                          Icons.info,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10), // Gap between rows

                // Moving Text Row 7
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SlideTransition(
                        position: _offsetAnimation,
                        child: const Text(
                          "Moving Text from Right to Left",
                          style: TextStyle(fontSize: 24, color: Colors.green),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                            SlideTransition(
                              position: _offsetAnimation,
                              child: const Text(
                                "Moving Text from Right to Left",
                                style: TextStyle(fontSize: 24, color: Colors.green),
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
                ),
                const SizedBox(height: 10),
                // Row 8

                Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "semanticsLabel Text Widget..",
                        semanticsLabel:
                            "Any Widget More Describe to this Label",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                        Text(
                        "semanticsLabel Text Widget..",
                        semanticsLabel:
                            "Any Widget More Describe to this Label",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                          ''');
                        },
                        child: const Icon(
                          Icons.info_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
