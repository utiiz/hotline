import 'package:app/models/user.dart';
import 'package:app/widgets/rounded_checkbox.dart';
import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  final User user;
  final Function(bool) onSelect;
  final ValueNotifier reset;
  final Function onReset;
  static double size = 50;

  const UserItem({Key key, this.user, this.onSelect, this.reset, this.onReset}) : super(key: key);
  @override
  _UserItemState createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> borderAnimation, sizeAnimation, opacityAnimation;
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    )..addListener(() {
        setState(() {});
      });

    widget.reset.addListener(() {
      setState(() {
        _selected = false;
      });

      controller.reverse();
    });

    borderAnimation = Tween<double>(begin: 0, end: 2.5).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    sizeAnimation = Tween<double>(begin: 5.5, end: 17.5).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (_selected) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            _selected = !_selected;
          });
          widget.onSelect(_selected);
        },
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(left: 7.5, right: 7.5),
          padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            children: <Widget>[
              RoundedCheckbox(
                size: UserItem.size,
                sizeAnimation: sizeAnimation,
                opacityAnimation: opacityAnimation,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: UserItem.size,
                height: UserItem.size,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Color(0xFFFFDA1A), width: borderAnimation.value),
                  borderRadius: BorderRadius.all(Radius.circular(UserItem.size / 3)),
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/profil_pic_men.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17.5, right: 17.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.user.firstName + ' ' + widget.user.lastName,
                      style: TextStyle(
                        fontFamily: 'Verdana',
                        fontSize: 14,
                        color: Color(0xFF424D5C),
                        height: 1.25,
                      ),
                    ),
                    Text(
                      widget.user.email,
                      style: TextStyle(
                        fontFamily: 'Verdana',
                        fontSize: 12,
                        color: Color(0xFF9FA7B2),
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
