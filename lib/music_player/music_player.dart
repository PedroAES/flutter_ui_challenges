import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF162336),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:20, right:20, top:50, bottom:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('It\'s You',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text('Pedro Santana',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
    
                  ],
                ),
                Icon(FontAwesomeIcons.gamepad, color: Colors.white)
              ],
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Image.network('https://cdn.pixabay.com/photo/2017/04/19/10/24/vinyl-2241789_960_720.png',
              width: MediaQuery.of(context).size.width*0.9,
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.music_note, size: 38,),
                      Icon(FontAwesomeIcons.marker, size: 30,),
                      Icon(Icons.share, size: 35),
                      Icon(Icons.more_horiz, size: 40,)
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('00:03',
                    style: TextStyle(
                      color: Colors.white30
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 20,
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 3,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width*0.64,
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('03:34',
                    style: TextStyle(
                      color: Colors.white30
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.white70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.repeat, size: 35),
                      Icon(FontAwesomeIcons.stepBackward, size: 40,),
                      Icon(FontAwesomeIcons.pauseCircle, size: 60),
                      Icon(FontAwesomeIcons.stepForward, size: 40),
                      Icon(Icons.queue_music, size: 40)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}