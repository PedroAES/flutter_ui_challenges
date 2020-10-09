import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/financial/credit_card.dart';
import 'package:flutter_ui_challenges/financial/icon_button.dart';
import 'package:flutter_ui_challenges/financial/transaction_item.dart';

class Financial extends StatefulWidget {
  @override
  _FinancialState createState() => _FinancialState();
}

class _FinancialState extends State<Financial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E5EC),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text('WALLET',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(8),
              width: 25,
              height: 25,
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 30,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 5),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          border: Border.all(color: Colors.white, width: 1)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 35),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)
                )
              ),
              child: CreditCard(
                number:  '4000  1234  5678  9010',
                validFrom: '09/23',
                validThru: '09/23',
                cardHolder: 'Pedro Santana',
              )
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MyIconButton(
                    backgroundColor: Color(0xFFEEF1FD),
                    label: 'SEND',
                    imageName: 'assets/images/send.png',
                    onTap: null
                  ),
                  MyIconButton(
                    backgroundColor: Color(0xFFFFF3EB),
                    label: 'TRANSFER',
                    imageName: 'assets/images/transfer.png',
                    onTap: null
                  ),
                  MyIconButton(
                    backgroundColor: Color(0xFFFEEDF4),
                    label: 'PASSBOOK',
                    imageName: 'assets/images/passbook.png',
                    onTap: null
                  ),
                  MyIconButton(
                    backgroundColor: Color(0xFFEBFAF9),
                    label: 'MORE',
                    imageName: 'assets/images/more.png',
                    onTap: null
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Transactions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                  color: Colors.deepPurple[900]
                                )
                              ),
                              child: Center(
                                child: Text('MORE',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple[900]
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  TransactionItem(
                    name: 'John Doe',
                    status: 'Transfered',
                    value: '+\$201,00',
                    date: '05 Sep 2020',
                    iconName: 'assets/images/transfer.png',
                    iconBackgroundColor: Color(0xFFFFF3EB),
                  ),
                  TransactionItem(
                    name: 'Amelia Nelson',
                    status: 'Added to Wallet',
                    value: '+\$300,00',
                    date: '05 Sep 2020',
                    iconName: 'assets/images/secret.png',
                    iconBackgroundColor: Color(0xFFFEEDF4),
                  ),
                  TransactionItem(
                    name: 'Martin Anderson',
                    status: 'Sent',
                    value: '-\$201,00',
                    date: '05 Sep 2020',
                    iconName: 'assets/images/send.png',
                    iconBackgroundColor: Color(0xFFEEF1FD),
                  ),
                  TransactionItem(
                    name: 'John Doe',
                    status: 'Transfered',
                    value: '+\$500,00',
                    date: '05 Sep 2020',
                    iconName: 'assets/images/transfer.png',
                    iconBackgroundColor: Color(0xFFFFF3EB),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

