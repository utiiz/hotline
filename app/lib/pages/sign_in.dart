import 'package:app/widgets/bottom_sheet.dart';
import 'package:app/widgets/bottom_sheet_content.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/input.dart';
import 'package:app/widgets/button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, this.onSubmit}) : super(key: key);

  final VoidCallback onSubmit;
  static final TextEditingController _username = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();

  String get username => _username.text;
  String get password => _password.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 75, bottom: 50),
                  height: 225,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/assets/images/sign_in.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Sign in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Verdana',
                    fontSize: 40,
                    color: Color(0xFF424D5C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 35,
                    bottom: 35,
                  ),
                  child: Text(
                    'Sign in by using email address\nand a password for the app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Verdana',
                      height: 1.5,
                      fontSize: 14,
                      color: Color(0xFF9FA7B2),
                    ),
                  ),
                ),
                Input(
                  label: 'Username or e-mail address...',
                  controller: _username,
                ),
                Input(
                  label: 'Password...',
                  password: true,
                  controller: _password,
                ),
                Button(
                  top: 35,
                  bottom: 30,
                  text: 'Connect',
                  onPressed: (BuildContext c) {
                    // Navigator.of(context).pushNamed('/first_login');
                    showModalBottomSheet(
                      context: c,
                      builder: (context) => BottomSheetW(),
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                    );
                  },
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Verdana',
                      fontSize: 13,
                      color: Color(0xFF9FA7B2),
                    ),
                    children: [
                      TextSpan(
                        text: 'Forgot your password? ',
                      ),
                      TextSpan(
                        text: 'Click here',
                        style: TextStyle(
                          color: Color(0xFF256AC4),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
