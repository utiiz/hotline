import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextInputAction action;
  final bool password;
  final String label;
  final TextEditingController controller;

  const Input({Key key, this.action, this.password = false, @required this.label, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 7.5, bottom: 7.5),
      child: TextField(
        controller: controller,
        obscureText: password,
        style: TextStyle(color: Color(0xFF5E6774), fontFamily: 'Verdana', fontSize: 14),
        cursorColor: Color(0xFF5E6774),
        textInputAction: action != null ? action : TextInputAction.next,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Color(0xFFB3BBC6), fontFamily: 'Verdana', fontSize: 14),

          // helperText: 'E-mail address...',
          contentPadding: EdgeInsets.fromLTRB(25, 18, 25, 18),
          enabledBorder: OutlineInputBorder(
            gapPadding: 10,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Color(0xFFD2D9E3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Color(0xFFB0B9C4)),
          ),
        ),
      ),
    );
  }
}
