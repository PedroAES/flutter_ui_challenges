import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_challenges/clean_login_page/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  static String tag = '/login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController signInEmailController = new TextEditingController();
  TextEditingController signInPasswordController = new TextEditingController();
  TextEditingController signUpEmailController = new TextEditingController();
  TextEditingController signUpNameController = new TextEditingController();
  TextEditingController signUpPasswordController = new TextEditingController();
  TextEditingController signUpGenderController = new TextEditingController();
  TextEditingController signUpPlanController = new TextEditingController();
  final FocusNode signInEmailFocus = new FocusNode();
  final FocusNode signInPasswordFocus = new FocusNode();
  final FocusNode signUpNameFocus = new FocusNode();
  final FocusNode signUpEmailFocus = new FocusNode();
  final FocusNode signUpPasswordFocus = new FocusNode();
  final FocusNode signUpGenderFocus = new FocusNode();
  final FocusNode signUpPlanFocus = new FocusNode();
  PageController _pageController;
  Color left = Colors.black;
  Color right = Colors.white;
  bool _obscureTextSignIn = true;
  bool _obscureTextSignUp = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height >= 775.0
              ? MediaQuery.of(context).size.height
              : 775.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 15),
                child: _buildMenuBar(context),
              ),
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 85.0,
                  child: Image.asset('assets/images/logo1.png'),
                ),
              ),
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (i) {
                    if (i == 0) {
                      setState(() {
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: <Widget>[
                    new ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: _buildSignIn(context),
                    ),
                    new ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: _buildSignUp(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

  void _fieldFocusChange(BuildContext context, FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 165.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "Entrar",
                  style: TextStyle(
                      color: left,
                      fontSize: 12.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Registrar",
                  style: TextStyle(
                      color: right,
                      fontSize: 12.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context){
    final email = TextFormField(
      focusNode: signInEmailFocus,
      autofocus: false,
      controller: signInEmailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (term){
        if(signInEmailController.text != '')
          _fieldFocusChange(context, signInEmailFocus, signInPasswordFocus);
      },
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.email),
      ),
    );

    final password = TextFormField(
      focusNode: signInPasswordFocus,
      autofocus: false,
      controller: signInPasswordController,
      obscureText: _obscureTextSignIn,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: _toggleSignIn,
          child: Icon(
            _obscureTextSignIn
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash,
            size: 15.0,
            color: Colors.black,
          ),
        ),
      ),
        
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 30.0),
      child: RaisedButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(12),
        color: MyColors.primaryBlack,
        child: Text('Entrar ', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Esqueceu a senha?',
        style: TextStyle(color: MyColors.primaryBlue),
      ),
      onPressed: () {},
    );

    final Row socialMedia= Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, right: 40.0),
          child: GestureDetector(
            onTap: () => showInSnackBar("Facebook button pressed"),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: new Icon(
                FontAwesomeIcons.facebookF,
                color: MyColors.primaryBlue,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () => showInSnackBar("Google button pressed"),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: new Icon(
                FontAwesomeIcons.google,
                color: MyColors.primaryBlue,
              ),
            ),
          ),
        ),
      ],
    );

    final Row or = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.black12,
                  Colors.black,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: 100.0,
          height: 1.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            "Ou",
            style: TextStyle(
                color: MyColors.primaryBlack,
                fontSize: 16.0,
                fontFamily: "WorkSansMedium"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black12,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: 100.0,
          height: 1.0,
        ),
      ],
    );
    return Container (
      child: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 35.0, right: 35.0),
          children: <Widget>[
            SizedBox(height: 10.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 30.0),
            loginButton,
            forgotLabel,
            SizedBox(height: 20.0),
            or,
            socialMedia,
          ],
        ),
      )
    );
  }

  Widget _buildSignUp(BuildContext context) {
    final name = TextFormField(
      focusNode: signUpNameFocus,
      autofocus: false,
      controller: signUpNameController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (term){
        if(signUpNameController.text != '')
          _fieldFocusChange(context, signUpNameFocus, signUpEmailFocus);
      },
      decoration: InputDecoration(
        hintText: 'Nome',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.person),
      ),
    );

    final email = TextFormField(
      focusNode: signUpEmailFocus,
      autofocus: false,
      controller: signUpEmailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (term){
        if(signUpEmailController.text != '')
          _fieldFocusChange(context, signUpEmailFocus, signUpPasswordFocus);
      },
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.email),
      ),
    );

    final password = TextFormField(
      focusNode: signUpPasswordFocus,
      autofocus: false,
      controller: signUpPasswordController,
      obscureText: _obscureTextSignUp,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: _toggleSignUp,
          child: Icon(
            _obscureTextSignUp
                ? FontAwesomeIcons.eyeSlash
                : FontAwesomeIcons.eye,
            size: 15.0,
            color: Colors.black,
          ),
        ),
      ),
      onFieldSubmitted: (term){
        if(signUpPasswordController.text != '')
          _fieldFocusChange(context, signUpPasswordFocus, signUpGenderFocus);
      },
    );

    final genre = TextFormField(
      focusNode: signUpGenderFocus,
      autofocus: false,
      controller: signUpGenderController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (term){
        if(signUpGenderController.text != '')
          _fieldFocusChange(context, signUpGenderFocus, signUpPlanFocus);
      },
      decoration: InputDecoration(
        hintText: '(M/F)',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: GestureDetector(
          child: Icon(
            Icons.panorama_fish_eye,
          )
        ),
      ),
    );


    final plan = TextFormField(
      focusNode: signUpPlanFocus,
      autofocus: false,
      controller: signUpPlanController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Plano',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.phone_android),
      ),
    );
    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 30.0),
      child: RaisedButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(12),
        color: MyColors.primaryBlack,
        child: Text('Registrar-se', style: TextStyle(color: Colors.white)),
      ),
    );

    return Container (
      child: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 35.0, right: 35.0),
          children: <Widget>[
            SizedBox(height: 10.0),
            name,
            SizedBox(height: 8.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 8.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: genre,
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: plan,
                  flex: 2,
                ),
              ],
            ),
            SizedBox(height: 25),
            registerButton,
          ],
        ),
      )
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
    signUpNameFocus.unfocus();
    signUpEmailFocus.unfocus();
    signUpPasswordFocus.unfocus();
    signUpGenderFocus.unfocus();
    signUpPlanFocus.unfocus();
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
    signInEmailFocus.unfocus();
    signInPasswordFocus.unfocus();
  }

  void _toggleSignIn() {
    setState(() {
      _obscureTextSignIn = !_obscureTextSignIn;
    });
  }

  void _toggleSignUp() {
    setState(() {
      _obscureTextSignUp = !_obscureTextSignUp;
    });
  }
}

class CustomBehavior extends ScrollBehavior{
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection){
    return child;
  }
}

class TabIndicationPainter extends CustomPainter {
  Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  final PageController pageController;

  TabIndicationPainter(
      {this.dxTarget = 55.0,
        this.dxEntry = 25.0,
        this.radius = 15.0,
        this.dy = 20.0, this.pageController}) : super(repaint: pageController) {
    painter = new Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {

    final pos = pageController.position;
    double fullExtent = (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);

    double pageOffset = pos.extentBefore / fullExtent;

    bool left2right = dxEntry < dxTarget;
    Offset entry = new Offset(left2right ? dxEntry: dxTarget, dy);
    Offset target = new Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = new Path();
    path.addArc(
        new Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(
        new Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(
        new Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawShadow(path, MyColors.primaryBlue, 3.0, true);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(TabIndicationPainter oldDelegate) => true;
}