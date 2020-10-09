import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/clean_login_page/widgets/custom_textformfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({this.controller});
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      hintText: 'Password',
      obscureText: _obscureText,
      prefixIcon: Icon(Icons.lock),
      sufixIcon: GestureDetector(
        onTap: _toggle,
        child: Icon(
          _obscureText
              ? FontAwesomeIcons.eye
              : FontAwesomeIcons.eyeSlash,
          size: 15.0,
          color: Colors.black,
        ),
      ),
    );
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}