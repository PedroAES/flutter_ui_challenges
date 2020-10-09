import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/clean_login_page/login_page.dart';
import 'package:flutter_ui_challenges/clean_login_page/pages/login/password_field.dart';
import 'package:flutter_ui_challenges/clean_login_page/widgets/custom_button.dart';
import 'package:flutter_ui_challenges/clean_login_page/widgets/custom_textformfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignUp  extends StatelessWidget {
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
              hintText: 'Name',
              prefixIcon: Icon(Icons.person),
              obscureText: false,
            ),
            SizedBox(height: 8.0),
            CustomTextFormField(
              hintText: 'E-mail',
              prefixIcon: Icon(Icons.mail),
              obscureText: false,
            ),
            SizedBox(height: 8.0),
            PasswordField(),
            SizedBox(height: 8.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: CustomTextFormField(
                      hintText: 'Genre',
                      prefixIcon: Icon(FontAwesomeIcons.genderless),
                      obscureText: false,
                    ),
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: CustomTextFormField(
                    hintText: 'Plan',
                    prefixIcon: Icon(Icons.business_center),
                    obscureText: false,
                  ),
                  flex: 2,
                ),
              ],
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom:90, left: 45, right: 45),
              child: CustomButton(
                text: 'Register',
                onPressed: (){

                },
              ),
            )
          ],
        ),
      )
    );
  }
}