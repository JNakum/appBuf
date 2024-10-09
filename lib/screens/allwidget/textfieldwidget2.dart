import 'package:flutter/material.dart';

class Textfieldwidget2 extends StatefulWidget {
  const Textfieldwidget2({Key? key}) : super(key: key);

  @override
  State<Textfieldwidget2> createState() => _Textfieldwidget2State();
}

class _Textfieldwidget2State extends State<Textfieldwidget2> {
  final _formKey = GlobalKey<FormState>();

  // Creating controllers for each TextFormField
  final TextEditingController _controller1 = TextEditingController();

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
      ),
      body: SingleChildScrollView(
        // Scrollable form
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Manually added TextFormFields
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(
                    // Changed to non-const
                    labelText: 'Field 1',
                    border: OutlineInputBorder(), // This can remain constant
                  ),
                  onSubmitted: (value) {
                    _submit(); // Call the submit function
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: TextField(),
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
