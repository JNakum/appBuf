// import 'package:appbuf/screens/allwidget/textfieldwidget.dart';
import 'package:appbuf/screens/customDialog/dialogutils.dart';
import 'package:appbuf/screens/customDropdown/customdropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class Textfieldwidget2 extends StatefulWidget {
  const Textfieldwidget2({super.key});

  @override
  State<Textfieldwidget2> createState() => _Textfieldwidget2State();
}

class _Textfieldwidget2State extends State<Textfieldwidget2>
    with RestorationMixin {
  final _formKey = GlobalKey<FormState>();

  // RestorationId
  final RestorableString _textInput = RestorableString('');
  @override
  String get restorationId => 'text_field_example';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_textInput, 'input_text');
  }

  // Creating controllers for each TextFormField

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _onEditingComplete = TextEditingController();

  String? _errorMessage;

  // Email validation pattern using RegExp
  RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  bool isTextFieldEnabled = true;

  // FocuseNode In TextField..
  final FocusNode _focusNode = FocusNode();

  // DropDown
  String? selectedValue;

  //  buildCounter method
  final TextEditingController _buildCounterController = TextEditingController();
  String _characterCountMessage = "";

  void _countCharacters() {
    String text = _buildCounterController.text; // TextField se text lena
    int characterCount = text.length; // Characters ki count lena

    setState(() {
      _characterCountMessage = '* $characterCount *'; // Count update karna
    });
  }

  @override
  void dispose() {
    _buildCounterController.dispose(); // Controller ko dispose karna
    _textInput.dispose();
    super.dispose();
  }

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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Form is valid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted: ${_controller1.text}')),
      );
      // Clear the text field after submission
      _controller1.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 191, 0), // Set background color
      appBar: AppBar(
        title: const Text('Textfieldwidget2'),
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
      body: SingleChildScrollView(
        // Scrollable form
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Manually added TextFormFields
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        enableInteractiveSelection: false,
                        controller: _controller1,
                        decoration: const InputDecoration(
                          // Changed to non-const
                          labelText: 'OnSubmitted Method.. No Select Text..',
                          border:
                              OutlineInputBorder(), // This can remain constant
                        ),
                        onSubmitted: (value) {
                          _submit(); // Call the submit function
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        DialogUtils.showTextProperties(context, '''
 TextField(
controller: _controller1,
decoration: const InputDecoration(
// Changed to non-const
labelText: 'OnSubmitted Method..',
border:
OutlineInputBorder(), // This can remain constant
),
onSubmitted: (value) {
_submit(); // Call the submit function
},
),

 ''');
                      },
                      child: const Icon(Icons.info_sharp),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _onEditingComplete,
                      decoration: InputDecoration(
                        labelText:
                            "Enter Text.. onEditingCompleteEmail Validation",
                        errorText: _errorMessage,
                        hintText: "Enter Somethings..",
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {
                        setState(() {
                          String inputEmail = _onEditingComplete.text;

                          if (inputEmail.isEmpty) {
                            _errorMessage = "Email Cannot be Empty..!";
                          } else if (!emailRegex.hasMatch(inputEmail)) {
                            _errorMessage = "Enter A Valid Email Address";
                          } else {
                            _errorMessage = null;
                            print("Valid Email => * $inputEmail * ");
                          }
                        });
                        // print(
                        //     "User Ne Input Complete Kiya => ${_onEditingComplete.text}");
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Expanded(
child: TextField(
controller: _onEditingComplete,
decoration: InputDecoration(
labelText: "Enter Text..",
errorText: _errorMessage,
hintText: "Enter Somethings..",
border: const OutlineInputBorder(),
),
keyboardType: TextInputType.emailAddress,
onEditingComplete: () {
setState(() {
String inputEmail = _onEditingComplete.text;

if (inputEmail.isEmpty) {
_errorMessage = "Email Cannot be Empty..!";
} else if (!emailRegex.hasMatch(inputEmail)) {
_errorMessage = "Enter A Valid Email Address";
} else {
_errorMessage = null;
print("Valid Email => * inputEmail * ");
}
});
// print(
//     "User Ne Input Complete Kiya => {_onEditingComplete.text}");
},
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

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      enableIMEPersonalizedLearning: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        UpperCaseTextFormatter()
                      ],
                      decoration: InputDecoration(
                        labelText:
                            "UpperCaseTextFormatter inputFormatters 10 Length",
                        hintText: "Enter Text..",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Expanded(
child: TextField(
inputFormatters: [
LengthLimitingTextInputFormatter(10),
UpperCaseTextFormatter()
],
decoration: InputDecoration(
labelText:
"UpperCaseTextFormatter inputFormatters 10 Length",
hintText: "Enter Text..",
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(8)),
),
),
),

*********************************************
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text
          .toUpperCase(), // Input ko uppercase me convert karta hai
      selection: newValue.selection,
    );
  }
}

*********************************************

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
                children: [
                  Expanded(
                    child: TextField(
                      // keyboardAppearance: Brightness.light,
                      // scrollPadding: const EdgeInsets.only(bottom: 350),
                      // dragStartBehavior: DragStartBehavior.start,
                      selectionHeightStyle: ui.BoxHeightStyle.tight,
                      cursorWidth: 20,
                      cursorColor: Colors.red,
                      cursorOpacityAnimates: true,
                      // cursorErrorColor: Colors.black,
                      enabled: isTextFieldEnabled,

                      decoration: InputDecoration(
                        labelText: "Enter Something.. enabled , cursorWidth",
                        hintText: "Enter Text..",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isTextFieldEnabled = !isTextFieldEnabled;
                      });
                    },
                    child: Text(isTextFieldEnabled ? "Disable" : "Enable"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  isTextFieldEnabled
                      ? GestureDetector(
                          onTap: () {
                            print("Wdget Tapped..!  , * onTapAlwaysCalled *");
                            DialogUtils.showTextProperties(
                                context,
                                '''
Expanded(
child: TextField(
enabled: isTextFieldEnabled,
decoration: InputDecoration(
labelText: "Enter Something.. enabled",
hintText: "Enter Text..",
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(8),
),
),
),
),
const SizedBox(
width: 5,
),
ElevatedButton(
onPressed: () {
setState(() {
isTextFieldEnabled = !isTextFieldEnabled;
});
},
child: Text(isTextFieldEnabled ? "Disable" : "Enable"),
),
const SizedBox(
width: 5,
),
isTextFieldEnabled
? GestureDetector(
onTap: () {
DialogUtils.showTextProperties(
context,
'''
                                ''');
},
child: const Icon(Icons.info),
)
: const Icon(
Icons.info,
color: Colors.green,
)
''');
                          },
                          child: const Icon(
                            Icons.info,
                            color: Colors.green,
                          ),
                        )
                      : const Icon(
                          Icons.info,
                          color: Colors.red,
                        )
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        labelText: "Tap Outside To Dismis KeyBord...",
                        hintText: "onTapOutside...",
                        border: OutlineInputBorder(),
                      ),
                      onTapOutside: (event) {
                        _focusNode.unfocus();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
 Expanded(
child: TextField(
focusNode: _focusNode,
decoration: const InputDecoration(
labelText: "Tap Outside To Dismis KeyBord...",
hintText: "onTapOutside...",
border: OutlineInputBorder(),
),
onTapOutside: (event) {
_focusNode.unfocus();
},
),
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
                children: [
                  Expanded(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.basic,
                      child: TextField(
                        readOnly: true,
                        enableInteractiveSelection: false,
                        decoration: const InputDecoration(
                          labelText: "mouseCursor",
                          hintText: "mouseCursor",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey, width: 5)),
                        ),
                        controller: TextEditingController(
                            text:
                                "This is a read-only, non-selectable, non-copyable text."),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Expanded(
child: MouseRegion(
cursor: SystemMouseCursors.basic,
child: TextField(
readOnly: true,
enableInteractiveSelection: false,
decoration: const InputDecoration(
labelText: "mouseCursor",
hintText: "mouseCursor",
focusedBorder: OutlineInputBorder(
borderSide:
BorderSide(color: Colors.blueGrey, width: 5)),
),
controller: TextEditingController(
text:
"This is a read-only, non-selectable, non-copyable text."),
),
),
),
''');
                    },
                    child: const Icon(Icons.info_rounded),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _buildCounterController,
                      autofillHints: const [AutofillHints.email],
                      decoration: const InputDecoration(
                        hintText: "autofillHints buildCounter",
                        labelText: "autofillHints buildCounter method..",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: _countCharacters,
                    child: const Text("Count Text"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(_characterCountMessage),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(
                          context,
                          '''
Row(
children: [
Expanded(
child: TextField(
controller: _buildCounterController,
autofillHints: const [AutofillHints.email],
decoration: const InputDecoration(
hintText: "autofillHints buildCounter",
labelText: "autofillHints buildCounter method..",
border: OutlineInputBorder(),
),
),
),
const SizedBox(
width: 5,
),
ElevatedButton(
onPressed: _countCharacters,
child: const Text("Count Text"),
),
const SizedBox(
width: 5,
),
Text(_characterCountMessage),
const SizedBox(
width: 5,
),
GestureDetector(
onTap: () {
DialogUtils.showTextProperties(context, '''
                          ''');
},
child: const Icon(Icons.info),
),
],
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
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        _textInput.value;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter Text Use restorationId",
                        labelText: "Enter Text Use restorationId",
                      ),
                      controller: TextEditingController(text: _textInput.value),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Expanded(
child: TextField(
onChanged: (value) {
_textInput.value;
},
decoration: const InputDecoration(
hintText: "Enter Text Use restorationId",
labelText: "Enter Text Use restorationId",
),
controller: TextEditingController(text: _textInput.value),
),
),
**************************************
// RestorationId
  final RestorableString _textInput = RestorableString('');
  @override
  String get restorationId => 'text_field_example';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_textInput, 'input_text');
  }
**************************************

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
                children: [
                  Expanded(
                    child: TextField(
                      contextMenuBuilder: (BuildContext context,
                          EditableTextState editableTextState) {
                        return AdaptiveTextSelectionToolbar(
                          anchors: editableTextState.contextMenuAnchors,
                          children: [
                            TextButton(
                              onPressed: () {
                                editableTextState.copySelection(
                                    SelectionChangedCause.toolbar);
                              },
                              child: const Text('Custom Copy'),
                            ),
                            TextButton(
                              onPressed: () {
                                editableTextState.cutSelection(
                                    SelectionChangedCause.toolbar);
                              },
                              child: const Text('Custom Cut'),
                            ),
                            TextButton(
                              onPressed: () {
                                editableTextState
                                    .pasteText(SelectionChangedCause.toolbar);
                              },
                              child: const Text('Custom Paste'),
                            ),
                            TextButton(
                              onPressed: () {
                                editableTextState
                                    .selectAll(SelectionChangedCause.toolbar);
                              },
                              child: const Text('Select All'),
                            ),
                          ],
                        );
                      },
                      decoration: const InputDecoration(
                        hintText: 'Long press in text field..',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Expanded(
child: TextField(
contextMenuBuilder: (BuildContext context,
EditableTextState editableTextState) {
return AdaptiveTextSelectionToolbar(
anchors: editableTextState.contextMenuAnchors,
children: [
TextButton(
onPressed: () {
editableTextState.copySelection(
SelectionChangedCause.toolbar);
},
child: const Text('Custom Copy'),
),
TextButton(
onPressed: () {
editableTextState.cutSelection(
SelectionChangedCause.toolbar);
},
child: const Text('Custom Cut'),
),
TextButton(
onPressed: () {
editableTextState
.pasteText(SelectionChangedCause.toolbar);
},
child: const Text('Custom Paste'),
),
TextButton(
onPressed: () {
editableTextState
.selectAll(SelectionChangedCause.toolbar);
},
child: const Text('Select All'),
),
],
);
},
decoration: const InputDecoration(
hintText: 'Long press in text field..',
),
),
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
                children: [
                  const Expanded(
                    child: TextField(
                      canRequestFocus: false,
                      decoration: InputDecoration(
                        labelText: "canRequestFocus Only Past .. and select",
                        hintText: "canRequestFocus Only Past .. and select",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      DialogUtils.showTextProperties(context, '''
Expanded(
child: TextField(
canRequestFocus: false,
decoration: InputDecoration(
labelText: "canRequestFocus Only Past .. and select",
hintText: "canRequestFocus Only Past .. and select",
),
),
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

              const Row(
                children: [
                  Expanded(
                    child: TextField(
                      // spellCheckConfiguration: SpellCheckConfiguration(spellCheckEnabled: false,), // old version are not suppoted
                      decoration: InputDecoration(
                          labelText: "spellCheckEnabled Speling Check"),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom formatter to convert input to uppercase for display
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text
          .toUpperCase(), // Input ko uppercase me convert karta hai
      selection: newValue.selection,
    );
  }
}
