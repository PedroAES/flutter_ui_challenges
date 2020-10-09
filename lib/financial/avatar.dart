import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({@required this.imageName, @required this.backgroundColor});

  final String imageName;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: backgroundColor,
      child: Image.asset(
        imageName,
        height: 22,
        width: 22,
      ),
    );
  }
}