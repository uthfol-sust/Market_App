import 'package:flutter/material.dart';

class passwordText extends StatefulWidget {
  final String hint;

  const passwordText({Key? key, required this.hint}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<passwordText> {
  bool _isObscured = true; // Initial state: Password is hidden
  final FocusNode _focusNode = FocusNode(); // To detect focus state

  @override
  void dispose() {
    _focusNode.dispose(); // Clean up the focus node when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 14,
      ),
      obscureText: _isObscured,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.black38,
            width: 2.0,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured; // Toggle visibility
            });
          },
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
      ),
    );
  }
}
