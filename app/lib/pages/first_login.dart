import 'package:app/config/size_config.dart';
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
                          width: SizeConfig.blockSizeVertical * 35,
                          height: SizeConfig.blockSizeVertical * 35,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: SizeConfig.blockSizeVertical * 17.5,
                                height: SizeConfig.blockSizeVertical * 17.5,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockSizeVertical * 17.5 / 3)),
                                  image: DecorationImage(
                                    image: AssetImage('lib/assets/images/profil_pic_men.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: SizeConfig.blockSizeVertical,
                                left: SizeConfig.blockSizeVertical * 35 / 2 + SizeConfig.blockSizeVertical * 10,
                                child: Container(
                                  width: SizeConfig.blockSizeVertical * 4,
                                  height: SizeConfig.blockSizeVertical * 4,
                                  padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 0.5),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFDA1A),
                                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockSizeVertical * 4 / 3)),
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
                    top: SizeConfig.blockSizeVertical * 3.5,
                    bottom: SizeConfig.blockSizeVertical * 3.5,
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
                  top: SizeConfig.blockSizeVertical * 3.5,
                  bottom: SizeConfig.blockSizeVertical * 3.0,
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
