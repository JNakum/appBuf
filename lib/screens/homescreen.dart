import 'package:appbuf/screens/allwidget/textfieldwidget.dart';
// import 'package:appbuf/screens/allwidget/textfieldwidget2.dart';
import 'package:appbuf/screens/allwidget/textwidget.dart';
import 'package:appbuf/screens/customDropdown/customdropdown.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // DropDown
  String? selectedValue;

  // void navigateToPage(String page) {
  //   switch (page) {
  //     case 'Textfieldwidget':
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const Textfieldwidget()));
  //       break;
  //     case 'Textfieldwidget2':
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const Textfieldwidget2()));
  //       break;
  //     // Add more cases if you have additional pages
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(
            fontFamily: "FontMain",
          ),
        ),
        actions: [
          CustomDropdown(
            selectedValue: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
                navigateToPage(context, newValue!);
              });
            },
          ),
        ],
      ),

      // side Drawer Navigation Page Route

      // Drawer widget ko Scaffold me yaha add karein
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(
                    255, 255, 191, 0), // Background color for Drawer Header
              ),
              child: Text(
                'Drawer Navigation Menu...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // Textwidget ke liye ListTile
            ListTile(
              leading: const Icon(
                Icons.text_fields,
                color: Colors.pinkAccent,
              ),
              title: const Text(
                'Text Widget Screen',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Textwidget()),
                );
              },
            ),
            // Textfieldwidget ke liye ListTile (New Screen)
            ListTile(
              leading: const Icon(
                Icons.text_format,
                color: Colors.pinkAccent,
              ),
              title: const Text('TextField Widget Screen',
                  style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Textfieldwidget()),
                );
              },
            ),
          ],
        ),
      ),

      body: Container(
        color: const Color.fromARGB(255, 255, 191, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/thumbnail.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Textwidget()));
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black),
                ), // Button click karne par text change hoga
                child: const Text(
                  'Click Me!',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "FontMain"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
