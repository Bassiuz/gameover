import 'package:flutter/material.dart';

class RightEdgeSkewClipper extends CustomClipper<Path> {
  final double skewAmount = 20;

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width - skewAmount, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(RightEdgeSkewClipper oldClipper) => false;
}

class LeftEdgeSkewClipper extends CustomClipper<Path> {
  final double skewAmount = 20;

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(skewAmount, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(RightEdgeSkewClipper oldClipper) => false;
}
