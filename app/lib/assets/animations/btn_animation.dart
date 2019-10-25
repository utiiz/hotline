import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

enum AnimationToPlay {
  Activate,
  Deactivate,
  Enter,
  Leave,
}

class BtnAnimation extends StatefulWidget {
  final ValueNotifier isOpen;
  final Function callback;

  BtnAnimation({this.isOpen, this.callback});

  @override
  _BtnAnimationState createState() => _BtnAnimationState();
}

class _BtnAnimationState extends State<BtnAnimation> {
  static const double AnimationWidth = 412.5 / 3;
  static const double AnimationHeight = 200 / 3;
  static const double AnimationCloseSize = 87.5 / 3;
  static const double AnimationOpenSize = 150 / 3;
  static const double AnimationPaddingHorizontal = 131.25 / 3;
  static const double AnimationPaddingVertical = 25 / 3;
  AnimationToPlay _animationToPlay = AnimationToPlay.Enter;

  @override
  void initState() {
    super.initState();
    widget.isOpen.addListener(() {
      _setAnimationToPlay(widget.isOpen.value ? AnimationToPlay.Activate : AnimationToPlay.Deactivate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWidth,
      height: AnimationHeight,
      child: GestureDetector(
        onTapUp: ((info) {
          var localTouchPosition = (context.findRenderObject() as RenderBox).globalToLocal(info.globalPosition);

          bool closeTouched = localTouchPosition.dx < AnimationCloseSize && localTouchPosition.dy < AnimationCloseSize;
          bool openTouched = localTouchPosition.dx > AnimationPaddingHorizontal && localTouchPosition.dx < (AnimationPaddingHorizontal + AnimationOpenSize) && localTouchPosition.dy > AnimationPaddingVertical && localTouchPosition.dy < (AnimationPaddingVertical + AnimationOpenSize);

          if (_getAnimationToPlay(_animationToPlay) != _getAnimationToPlay(AnimationToPlay.Leave)) {
            if (_getAnimationToPlay(_animationToPlay) == _getAnimationToPlay(AnimationToPlay.Activate) && closeTouched) {
              widget.callback();
              _setAnimationToPlay(AnimationToPlay.Deactivate);
            } else if ((_getAnimationToPlay(_animationToPlay) == _getAnimationToPlay(AnimationToPlay.Deactivate) || _getAnimationToPlay(_animationToPlay) == _getAnimationToPlay(AnimationToPlay.Enter)) && openTouched) {
              _setAnimationToPlay(AnimationToPlay.Leave);
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushNamed('/first_login');
              });
            } else if (_getAnimationToPlay(_animationToPlay) == _getAnimationToPlay(AnimationToPlay.Activate) && openTouched) {
              _setAnimationToPlay(AnimationToPlay.Deactivate);
              Future.delayed(const Duration(milliseconds: 500), () {
                _setAnimationToPlay(AnimationToPlay.Leave);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.of(context).pushNamed('/first_login');
                });
              });
            }
          }
        }),
        child: FlareActor(
          'lib/assets/animations/btn_animation.flr',
          animation: _getAnimationToPlay(_animationToPlay),
        ),
      ),
    );
  }

  String _getAnimationToPlay(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.Activate:
        return 'activate';
        break;
      case AnimationToPlay.Deactivate:
        return 'deactivate';
        break;
      case AnimationToPlay.Enter:
        return 'enter';
        break;
      case AnimationToPlay.Leave:
        return 'leave';
        break;
      default:
        return 'deactivate';
    }
  }

  void _setAnimationToPlay(AnimationToPlay animationToPlay) {
    setState(() {
      _animationToPlay = animationToPlay;
    });
  }
}
