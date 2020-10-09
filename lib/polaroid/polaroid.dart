import 'package:flutter/material.dart';

class Polaroid extends StatefulWidget{
  @override
  _PolaroidState createState() => _PolaroidState();
}

class _PolaroidState extends State<Polaroid> {
  double top = 350;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD191BC),
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              left: 100,
              top: top,
              child: Container(
                color: Colors.white70,
                padding: EdgeInsets.all(8),
                alignment: Alignment.topCenter,
                width: 130,
                height: 130,
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF906050),
                        Color(0xFF794E40),
                        Color(0xFF603F35),
                        Color(0xFF453530),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
          
                    )
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          top=450;
                        });
                      },
                      child: Container(
                        height: 15,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.red[900],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)
                          )
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFF46576B),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)
                        ),
                      ),
                      child: Center(
                        child: Container(
                          height: 15,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF647A95),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50,)
       
                  ],
                ),
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F1F3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(6, 3)
                      )
                    ]
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 40,
                        left: 40,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color:  Colors.black,
                            shape: BoxShape.circle
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FractionallySizedBox(
                          widthFactor: 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 5,
                                color: Colors.blue[700]
                              ),
                              Container(
                                height: 5,
                                color: Colors.green[700]
                              ),
                              Container(
                                height: 5,
                                color: Colors.yellow[700]
                              ),
                              Container(
                                height: 5,
                                color: Colors.orange[700]
                              ),
                              Container(
                                height: 5,
                                color: Colors.red[700]
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF908E8F),
                              width: 4
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(2, 3), 
                              )
                            ],
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF727272),
                                Color(0xFF5C5C5D)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [
                                0.5,
                                0.5
                              ]
                              
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF39434E),
                              width: 3
                            ),
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF405057),
                                Color(0xFF3F484F)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [
                                0.5,
                                0.5
                              ]
                              
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF39434E),
                                  width: 3
                                ),
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF2F3945),
                                    Color(0xFF26303E)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [
                                    0.5,
                                    0.5
                                  ]
                                ),
                              ),
                            ),
                            Positioned(
                              right: 3,
                              bottom: 3,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white54
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
