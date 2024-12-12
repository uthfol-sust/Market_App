import 'package:flutter/material.dart';

import '../styles/AppTexts.dart';

class AppCheckBoxForSignUp extends StatefulWidget {
  final String text;

  const AppCheckBoxForSignUp({super.key, required this.text});

  @override
  State<AppCheckBoxForSignUp> createState() => _AppcheckboxforsignupState();
}

class _AppcheckboxforsignupState extends State<AppCheckBoxForSignUp> {
  bool isChecked = false; // Initialize the checkbox value to false

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.text, // Use the passed text dynamically
            style: AppTexts.subHeading2, // Custom text style
          ),
        ),
        Checkbox(
          checkColor: Colors.green, // Color of the check icon
          activeColor: Color(0xE3BDB2EF), // Background color when checked
          side: BorderSide(
            color: Colors.red, // Border color of the checkbox
          ),
          value: isChecked, // Current state of the checkbox
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false; // Update the state safely
            });
          },
        ),
      ],
    );
  }
}
