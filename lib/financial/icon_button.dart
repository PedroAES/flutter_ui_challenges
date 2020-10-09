
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/financial/avatar.dart';

class MyIconButton extends StatelessWidget {
  MyIconButton({
    @required this.backgroundColor,
    @required this.label,
    @required this.imageName,
    @required this.onTap,
  });

  final String label;
  final String imageName;
  final GestureTapCallback onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical:22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Avatar(
                backgroundColor: backgroundColor,
                imageName: imageName,
              ),
              Container(
                height: 10.0,
              ),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}