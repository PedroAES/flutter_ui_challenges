import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final String cardHolder;
  final String validFrom;
  final String validThru;
  final String number;

  const CreditCard({
    @required this.cardHolder,
    @required this.validFrom, 
    @required this.validThru,
    @required this.number
  });
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top:230),
            width: 270,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: Offset(0, 5),
                  spreadRadius: 5,
                  color: Color(0xFFFA6570),
                )
              ]
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top:15),
            height: 230,
            width: 405, 
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF8660),
                  Color(0xFFFA6570),
                ]
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top:20),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top:-130,
                    right: -110,
                    child: Text('m',
                      style: TextStyle(
                        fontSize: 360,
                        color: Colors.white10,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: Container(
                      height: 50,
                      child: Image.asset('assets/images/mastercard.png'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 70,
                        child: Image.asset('assets/images/chip.png')
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(number,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('VALID FROM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 7
                                  ),
                                ),
                                Text(validFrom,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('VALID THRU',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 7
                                  ),
                                ),
                                Text(validThru,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:15, top:10),
                        child: Text(cardHolder,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}