import 'package:bookworms/constants.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final Function? onpressed;
  const BottomNav({Key? key, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
        bottom: 0,
        left: 0,
        child: SizedBox(
            width: size.width,
            height: 80,
            child: Stack(children: [
              CustomPaint(
                size: Size(size.width, 80),
                painter: CustomButtonPaint(),
              ),
              Center(
                heightFactor: 0.6,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: colorGrey,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ])));
  }
}

class CustomButtonPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.lightGreen
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black.withOpacity(0.3), 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
