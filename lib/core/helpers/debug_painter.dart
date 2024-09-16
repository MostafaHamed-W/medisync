import 'package:flutter/material.dart';

class DebugPaint extends StatelessWidget {
  final Widget child;

  const DebugPaint({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _DebugPainter(),
      child: child,
    );
  }
}

class _DebugPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw the boundary rectangle
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
