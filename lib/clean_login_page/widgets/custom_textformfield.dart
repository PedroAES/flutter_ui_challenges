import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/clean_login_page/utils.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon prefixIcon;
  final Widget sufixIcon;
  final bool obscureText;

  const CustomTextFormField({this.controller, this.hintText, this.prefixIcon, 
      @ required this.obscureText, this.sufixIcon});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: MyColors.primaryBlack
      ),
      child: TextFormField(
        cursorColor: MyColors.primaryBlack,
        autofocus: false,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
        ),
      ),
    );
  }
}