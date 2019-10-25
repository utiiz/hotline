import 'package:flutter/material.dart';

class RoundedCheckbox extends StatelessWidget {
  final double size;
  final Animation<double> sizeAnimation, opacityAnimation;

  const RoundedCheckbox({Key key, this.size, this.sizeAnimation, this.opacityAnimation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: size / 2 - 17.5 / 2,
            left: size / 2 - 17.5 / 2,
            child: Container(
              width: 17.5,
              height: 17.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17.5 / 3)),
                border: Border.all(
                  color: Color(0xFFFFDA1A),
                  width: 2.5,
                ),
              ),
              child: Center(
                  child: Opacity(
                opacity: opacityAnimation.value,
                child: Container(
                  width: sizeAnimation.value,
                  height: sizeAnimation.value,
                  child: CustomPaint(
                    painter: RoundedCheckboxPainter(),
                  ),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedCheckboxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    _drawCheck(canvas, size, center);
  }

  void _drawCheck(Canvas canvas, Size size, Offset center) {
    Paint paint = Paint()
      ..color = Color(0xFF2A3134)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    double k = size.width;
    // As t goes from 0.0 to 1.0, animate the two check mark strokes from the
    // short side to the long side.
    center = Offset(center.dx - k / 2, center.dy - k / 2);
    final Path path = Path();
    Offset start = Offset(k * 0.15, k * 0.45);
    Offset mid = Offset(k * 0.4, k * 0.7);
    Offset end = Offset(k * 0.85, k * 0.25);
    path.moveTo(center.dx + start.dx, center.dy + start.dy);
    path.lineTo(center.dx + mid.dx, center.dy + mid.dy);
    path.lineTo(center.dx + end.dx, center.dy + end.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
