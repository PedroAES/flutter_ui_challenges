import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/clean_login_page/pages/clean_login_page.dart';
import 'package:flutter_ui_challenges/clean_login_page/pages/login/password_field.dart';
import 'package:flutter_ui_challenges/clean_login_page/utils.dart';
import 'package:flutter_ui_challenges/clean_login_page/widgets/custom_button.dart';
import 'package:flutter_ui_challenges/clean_login_page/widgets/custom_textformfield.dart';
import 'package:flutter_ui_challenges/clean_login_page/widgets/text_label.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: ScrollConfiguration(
        behavior: CustomBehavior(),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 35.0, right: 35.0),
          children: <Widget>[
            SizedBox(height: 10.0),
            CustomTextFormField(
              hintText: 'Email',
              prefixIcon: Icon(Icons.mail),
              obscureText: false,
            ),
            SizedBox(height: 8.0),
            PasswordField(),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 45, right: 45),
              child: CustomButton(
                text: 'Login',
                onPressed: (){
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => HomePage())
                  );
                }
              ),
            ),
            TextLabel(
              text: 'Forgot password?',
              onPressed: (){

              },
            ),
            SizedBox(height: 20.0),
            _buildGradientDivider(),
            _buildSocialMediaButtons(),
          ],
        ),
      )
    );
  }

  Widget _buildGradientDivider(){
    return Row(
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
  }

  Widget _buildSocialMediaButtons(){
     return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, right: 40.0),
          child: GestureDetector(
            onTap: (){

            },
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
            onTap: (){

            },
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
  }
}