import 'package:appbuf/screens/allwidget/textfieldwidget2.dart';
import 'package:flutter/material.dart';

class Textfieldwidget extends StatefulWidget {
  const Textfieldwidget({super.key});

  @override
  _Textfieldwidget createState() => _Textfieldwidget();
}

class _Textfieldwidget extends State<Textfieldwidget> {
  bool _secureText = true;
  String inputText = "";
  final TextEditingController _lastInputController = TextEditingController();
  final FocusNode _lastInputFocusNode = FocusNode();

  // Drop Down List Code
  String? selectedValue;

  final List<String> items = ['Textfieldwidget', 'Textfieldwidget2', 'Page 3'];

  void navigateToPage(String page) {
    switch (page) {
      case 'Textfieldwidget':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Textfieldwidget()));
        break;
      case 'Textfieldwidget2':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Textfieldwidget2()));
    }
  }

  @override
  void initState() {
    super.initState();

    // Add listener to the FocusNode
    _lastInputFocusNode.addListener(() {
      if (!_lastInputFocusNode.hasFocus) {
        // Check the input when the TextField loses focus
        String lastInput = _lastInputController.text;
        if (lastInput.isEmpty || lastInput.length < 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please enter at least 2 characters.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _lastInputController.dispose();
    _lastInputFocusNode.dispose();
    super.dispose();
  }

  void _showTextProperties(String properties) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("TextField Properties.."),
            content: SingleChildScrollView(
              child: Center(child: Text(properties)),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField Widget.."),
      ),
      body: SafeArea(
        // SafeArea added here
        child: SingleChildScrollView(
          // Scrolling functionality added here
          child: Center(
            child: Container(
              color: const Color.fromARGB(255, 255, 191, 0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          icon: const Icon(
                            Icons.list,
                            color: Colors.deepOrange,
                          ),
                          iconSize: 50,
                          // hint: const Text("Select A Page"),
                          value: selectedValue,
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue;
                              navigateToPage(newValue!);
                            });
                          },
                          style: const TextStyle(color: Colors.deepOrange),
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Row to hold TextField and Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter Your Text... maxLength=10",
                            hintText: "Enter Something...",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          maxLength: 10,
                        ),
                      ),
                      const SizedBox(
                          width: 15), // Space between TextField and Icon
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                          TextField(
                        decoration: InputDecoration(
                          labelText: "Enter Your Text...maxLength=10",
                          hintText: "Enter Something...",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        maxLength: 10,
                      ),
                        ''');
                        },
                        child: const Icon(Icons.info),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          obscureText: _secureText,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },
                                icon: Icon(_secureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility)),
                            labelText: "Enter Your Text...",
                            hintText:
                                "Enter Something...Obscure Text for Password ",
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
                        TextField(
                        obscureText: _secureText,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _secureText = !_secureText;
                                });
                              },
                              icon: Icon(_secureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility)),
                          labelText: "Enter Your Text...",
                          hintText:
                              "Enter Something...Obscure Text for Password ",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                     
                    ''');
                        },
                        child: const Icon(Icons.info_sharp),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20, // GAP OF TWO ROW
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter Your Text...focusedBorder",
                            hintText: "Enter Something....focusedBorder",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
TextField(
decoration: InputDecoration(
labelText: "Enter Your Text...",
hintText: "Enter Something....",
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.green, width: 2),
borderRadius: BorderRadius.circular(15),
),
focusedBorder: OutlineInputBorder(
borderSide:
BorderSide(color: Colors.blue, width: 5)),
),
),

''');
                        },
                        child: const Icon(Icons.info_sharp),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ), // GAP OF TWO ROW

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter Your Name Capitalize each word",
                            hintText: "Type your name.... Capitalize each word",
                            filled: true,
                            fillColor: Colors.green,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                                Icons.person), // Icon before the text field
                          ),
                          textCapitalization:
                              TextCapitalization.words, // Capitalize each word
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
TextField(
decoration: InputDecoration(
labelText: "Enter Your Name",
hintText: "Type your name....",
filled: true,
fillColor: Colors.green,
border: InputBorder.none,
prefixIcon:
Icon(Icons.person), // Icon before the text field
),
textCapitalization:
TextCapitalization.words, // Capitalize each word
),

                  ''');
                        },
                        child: const Icon(Icons.info_sharp),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0), // Inside padding
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent, // Background color
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter Email..',
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.email) // No border
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15), // Space between two TextFields
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0), // Inside padding
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent, // Background color
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              hintText: '9874563210',
                              border: InputBorder.none, // No border
                              counterText: "",
                              // prefixIcon: Icon(Icons.phone),
                              prefixText: '+91 | ',
                              prefixStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
Expanded(
child: Container(
padding: const EdgeInsets.all(8.0), // Inside padding
decoration: BoxDecoration(
color: Colors.lightBlueAccent, // Background color
borderRadius:
BorderRadius.circular(10), // Rounded corners
),
child: const TextField(
keyboardType: TextInputType.emailAddress,
decoration: InputDecoration(
labelText: 'Email',
hintText: 'Enter Email..',
border: InputBorder.none,
suffixIcon: Icon(Icons.email) // No border
),
),
),
),
const SizedBox(width: 15), // Space between two TextFields
Expanded(
child: Container(
padding: const EdgeInsets.all(8.0), // Inside padding
decoration: BoxDecoration(
color: Colors.lightGreenAccent, // Background color
borderRadius:
BorderRadius.circular(10), // Rounded corners
),
child: const TextField(
keyboardType: TextInputType.number,
maxLength: 10,
decoration: InputDecoration(
labelText: 'Mobile Number',
hintText: '9874563210',
border: InputBorder.none, // No border
counterText: "",
// prefixIcon: Icon(Icons.phone),
prefixText: '+91 | ',
prefixStyle: TextStyle(
color: Colors.black, fontWeight: FontWeight.bold),
),
),
),
),

                      ''');
                        },
                        child: const Icon(Icons.info_sharp),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: TextField(
                          // smartDashesType: SmartDashesType.enabled,
                          autofocus: true,
                          autocorrect: true,
                          enableSuggestions: false,
                          maxLines: 3,
                          // maxLength: 6,
                          // maxLengthEnforcement:
                          //     MaxLengthEnforcement.truncateAfterCompositionEnds,
                          decoration: InputDecoration(
                            labelText:
                                "Auto Foucus Selected InputTextfield , enableSuggestions",
                            hintText: "Enter Some Text",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
Flexible(
child: TextField(
// smartDashesType: SmartDashesType.enabled,
autofocus: true,
autocorrect: true,
enableSuggestions: false,
maxLines: 3,
// maxLength: 6,
// maxLengthEnforcement:
//     MaxLengthEnforcement.truncateAfterCompositionEnds,
decoration: InputDecoration(
labelText:
"Auto Foucus Selected InputTextfield , enableSuggestions",
hintText: "Enter Some Text",
),
),
),
 ''');
                        },
                        child: const Icon(Icons.info_sharp),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text("Data Show onChanged...! => * $inputText * "),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(child:  const Text('Data Show Here...! => $inputText ')),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              inputText = value;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: "Enter Text....",
                              hintText: "Type Text...."),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
 Expanded(
child: TextField(
onChanged: (value) {
setState(() {
inputText = value;
});
},
decoration: const InputDecoration(
labelText: "Enter Text....",
hintText: "Type Text...."),
),
),

 ''');
                        },
                        child: const Icon(Icons.info_sharp),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 70,
                  ),

                  // Last Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextField(
                          controller: _lastInputController,
                          focusNode: _lastInputFocusNode,
                          decoration: const InputDecoration(
                              labelText: "validation 2 char..",
                              hintText: "Enter Name Minimum 2 Char..."),
                          onEditingComplete: () {
                            String lastInput = _lastInputController.text;

                            if (lastInput.isEmpty || lastInput.length < 2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please enter at least 2 characters.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              // Do something with the valid input
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('You entered: $lastInput'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showTextProperties('''
Flexible(
child: TextField(
controller: _lastInputController,
focusNode: _lastInputFocusNode,
decoration: const InputDecoration(
labelText: "validation 2 char..",
hintText: "Enter Name Minimum 2 Char..."),
onEditingComplete: () {
String lastInput = _lastInputController.text;
if (lastInput.isEmpty || lastInput.length < 2) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Please enter at least 2 characters.'),
backgroundColor: Colors.red,
),
);
} else {
// Do something with the valid input
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(You entered: ),
backgroundColor: Colors.green,
),
);
}
},
),
),

*********************************************
final TextEditingController _lastInputController = TextEditingController();
  final FocusNode _lastInputFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Add listener to the FocusNode
    _lastInputFocusNode.addListener(() {
      if (!_lastInputFocusNode.hasFocus) {
        // Check the input when the TextField loses focus
        String lastInput = _lastInputController.text;
        if (lastInput.isEmpty || lastInput.length < 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please enter at least 2 characters.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _lastInputController.dispose();
    _lastInputFocusNode.dispose();
    super.dispose();
  }
*********************************************

 ''');
                        },
                        child: const Icon(Icons.info_sharp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
