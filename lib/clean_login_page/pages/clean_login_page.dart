import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/clean_login_page/utils.dart';

class HomePage extends StatefulWidget {
  static final  String routeName = '/home-page';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Pedro'),
              accountEmail: new Text('github.com/PedroAES'),
              decoration: new BoxDecoration(
                color: MyColors.primaryBlack,
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar1.png')),
            ),
            new ListTile(
                leading: Icon(Icons.contacts),
                title: new Text("Contacts"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.report_problem),
                title: new Text("Reporto"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.settings),
                title: new Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new Divider(),
            new ListTile(
                leading: Icon(Icons.info),
                title: new Text("About"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Exit"),
                onTap: () {
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              title: Text('Messages'),
              icon: Icon(Icons.chat, color: MyColors.primaryBlack)
          ),
          BottomNavigationBarItem(
              title: Text('Profile'),
              icon: Icon(Icons.person, color: MyColors.primaryBlack)
          ),
          BottomNavigationBarItem(
              title: Text('Forum'),
              icon: Icon(Icons.forum, color: MyColors.primaryBlack)
          ),
        ],
        onTap: (index){
          switch (index) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
          }
        },
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: ClipPath(
                      clipper: ClippingClass(),
                      child: Container(
                        height: 130.0,
                        decoration: BoxDecoration(color: MyColors.primaryBlack),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          image: DecorationImage(
                              image: AssetImage("assets/images/avatar1.png")),
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text('Welcome!',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: MyColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Positioned(
            top: 0.0,
            left:0.0,
            right: 0.0,
            child:  new AppBar(
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}