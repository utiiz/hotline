import 'package:app/config/size_config.dart';
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
    SizeConfig().init(context);
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
                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 7.5, bottom: SizeConfig.blockSizeVertical * 5.0),
                  height: SizeConfig.blockSizeVertical * 22.5,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
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
                    top: SizeConfig.blockSizeVertical * 3.5,
                    bottom: SizeConfig.blockSizeVertical * 3.5,
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
                  top: SizeConfig.blockSizeVertical * 3.5,
                  bottom: SizeConfig.blockSizeVertical * 3.0,
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
