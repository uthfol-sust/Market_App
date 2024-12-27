import 'package:flutter/material.dart';

import '../styles/AppColors.dart';


class AppTextField extends StatelessWidget{
  final String hint;

  const AppTextField({super.key, required this.hint});


  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 14,
        color: Colors.black54
      ),
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.black38,
            width: 2.0,
          ),
        ),
        filled: true,
        fillColor: AppColors.white.withOpacity(0.2),
      ),


    );
  }

}