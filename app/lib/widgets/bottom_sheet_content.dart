import 'package:app/config/size_config.dart';
import 'package:flutter/material.dart';

class BottomSheetW extends StatefulWidget {
  @override
  _BottomSheetWState createState() => _BottomSheetWState();
}

class _BottomSheetWState extends State<BottomSheetW> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeVertical * 5,
            child: Center(
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 7.5,
                height: SizeConfig.blockSizeVertical * 0.5,
                decoration: BoxDecoration(
                  color: Color(0xFFE1E5EB),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: SizeConfig.blockSizeVertical * 35,
                    color: Colors.green,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 35,
                    color: Colors.blue,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 35,
                    color: Colors.cyan,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
