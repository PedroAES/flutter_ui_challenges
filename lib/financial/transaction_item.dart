import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/financial/avatar.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    @required this.name,
    @required this.status,
    @required this.value,
    @required this.date,
    @required this.iconName,
    @required this.iconBackgroundColor
  });

  final String name;
  final String status;
  final String value;
  final String date;
  final String iconName;
  final Color iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Avatar(imageName:iconName, backgroundColor: iconBackgroundColor),
      title: Text(name,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(status,
        style: TextStyle(
          fontSize: 12
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          Text(date,
            style: TextStyle(
              fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}