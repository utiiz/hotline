import 'package:flutter/material.dart';

typedef ContextCallback = Function(BuildContext context);

class Button extends StatelessWidget {
  final double top;
  final double bottom;
  final String text;
  final ContextCallback onPressed;

  const Button({Key key, this.top = 0, this.bottom = 0, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 75,
        right: 75,
        top: top,
        bottom: bottom,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFDA1A),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onPressed(context);
          },
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          splashColor: Color(0xFF2D3439).withOpacity(0),
          highlightColor: Color(0xFF2D3439).withOpacity(0),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF2D3439),
                fontFamily: 'Verdana',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
