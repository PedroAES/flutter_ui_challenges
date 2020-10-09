import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/clean_login_page/utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;

  const CustomButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(12),
      color: MyColors.primaryBlack,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}