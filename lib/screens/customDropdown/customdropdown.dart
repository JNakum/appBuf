import 'package:appbuf/screens/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:appbuf/screens/allwidget/textfieldwidget.dart';
import 'package:appbuf/screens/allwidget/textfieldwidget2.dart';

// Navigate to Page function
void navigateToPage(BuildContext context, String page) {
  switch (page) {
    case 'Textfieldwidget':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Textfieldwidget()));
      break;
    case 'Textfieldwidget2':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Textfieldwidget2()));
      break;
    case "Homescreen":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Homescreen()));
      break;
  }
}

// CustomDropdown as a reusable widget
class CustomDropdown extends StatelessWidget {
  final String? selectedValue;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: const EdgeInsets.all(16),
      icon: const Icon(
        Icons.list,
        color: Colors.brown,
      ),
      underline: const SizedBox(),
      iconSize: 30,
      value: selectedValue,
      items: [
        'Textfieldwidget',
        'Textfieldwidget2',
        'Homescreen',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      style: const TextStyle(color: Colors.deepOrange),
      dropdownColor: Colors.white,
    );
  }
}
