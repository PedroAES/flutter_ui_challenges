import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/clean_login_page/utils.dart';

class TextLabel extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;

  const TextLabel({@required this.text, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(color: MyColors.primaryBlue),
      ),
      onPressed: onPressed,
    );
  }
}