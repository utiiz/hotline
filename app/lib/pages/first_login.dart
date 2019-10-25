import 'package:flutter/material.dart';
import 'package:app/widgets/input.dart';
import 'package:app/widgets/button.dart';

class FirstLoginPage extends StatelessWidget {
  const FirstLoginPage({Key key, this.onSubmit}) : super(key: key);

  final VoidCallback onSubmit;
  static final TextEditingController _fullname = new TextEditingController();
  static final TextEditingController _job = new TextEditingController();

  String get fullname => _fullname.text;
  String get job => _job.text;

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
                          width: 225,
                          height: 225,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  image: DecorationImage(
                                    image: AssetImage('lib/assets/images/profil_pic.jpg'),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 35 / 2,
                                left: 225 / 2 + 75,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFDA1A),
                                    borderRadius: BorderRadius.all(Radius.circular(12.5)),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('lib/assets/icons/camera.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Text(
                  'First Login',
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
                    'Please add your avatar and provide\nyour full name and job title',
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
                  label: 'Full name...',
                  controller: _fullname,
                ),
                Input(
                  label: 'Job title...',
                  controller: _job,
                ),
                Button(
                  top: 35,
                  bottom: 30,
                  text: 'Next',
                  onPressed: (BuildContext c) {
                    Navigator.of(context).pushNamed('/group');
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
                        text: 'Read more ',
                        style: TextStyle(
                          color: Color(0xFF256AC4),
                        ),
                      ),
                      TextSpan(
                        text: 'about the app',
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
