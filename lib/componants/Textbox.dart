import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  final String text;
  const Textbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
       style: TextStyle(
    color: Colors.black54.withOpacity(0.4), // Slightly more visible text
    fontSize: 12,
    ),
    );
  }
}
