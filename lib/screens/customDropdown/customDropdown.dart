import 'package:flutter/material.dart';

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
      icon: const Icon(
        Icons.list,
        color: Colors.purple,
      ),
      underline: const SizedBox(),
      iconSize: 30,
      value: selectedValue,
      items: [
        'Textfieldwidget',
        'Textfieldwidget2',
        'Page 3',
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
