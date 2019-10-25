import 'package:flutter/material.dart';

class BottomSheetW extends StatefulWidget {
  @override
  _BottomSheetWState createState() => _BottomSheetWState();
}

class _BottomSheetWState extends State<BottomSheetW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850,
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
            height: 50,
            child: Center(
              child: Container(
                width: 75,
                height: 5,
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
                    height: 350,
                    color: Colors.green,
                  ),
                  Container(
                    height: 350,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 350,
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
