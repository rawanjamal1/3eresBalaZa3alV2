import 'package:flutter/material.dart';

class Entrance extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const Entrance({super.key, required this.animation, required this.child});

  Widget door(bool left, double angle) {
    return Transform(
      alignment: left ? Alignment.centerLeft : Alignment.centerRight,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(left ? -angle : angle),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF123B45), Color(0xFF24505B), Color(0xFF0D202B)],
          ),
          border: Border.all(color: const Color(0xFFD8B982), width: 2),
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD8B982), width: 2),
              ),
            ),
            Align(
              alignment: left ? Alignment.centerRight : Alignment.centerLeft,
              child: const Icon(
                Icons.circle,
                color: Color(0xFFD8B982),
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final value = animation.value;

        final opening = const Interval(
          0.0,
          0.55,
          curve: Curves.easeInOutCubic,
        ).transform(value);

        final zoom = const Interval(
          0.35,
          0.8,
          curve: Curves.easeInOut,
        ).transform(value);

        final fade = const Interval(0.8, 1.0).transform(value);

        if (value >= 1) {
          return child!;
        }

        return AbsorbPointer(
          child: Stack(
            fit: StackFit.expand,
            children: [
              child!,

              Opacity(
                opacity: 1 - fade,
                child: ClipRect(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Transform.scale(
                        scale: 1 + zoom * 0.6,
                        child: const CustomPaint(painter: HallPainter()),
                      ),

                      if (opening < 1)
                        Row(
                          children: [
                            Expanded(child: door(true, opening * 1.55)),
                            Expanded(child: door(false, opening * 1.55)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HallPainter extends CustomPainter {
  const HallPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    canvas.drawRect(
      Offset.zero & size,
      Paint()
        ..shader = const RadialGradient(
          colors: [Color(0xFFF6E1B3), Color(0xFF94784B), Color(0xFF0D202B)],
        ).createShader(Offset.zero & size),
    );

    final aisle = Path()
      ..moveTo(w * 0.46, h * 0.42)
      ..lineTo(w * 0.54, h * 0.42)
      ..lineTo(w * 0.85, h)
      ..lineTo(w * 0.15, h)
      ..close();

    canvas.drawPath(aisle, Paint()..color = const Color(0xFFE8D8B7));

    for (int i = 0; i < 3; i++) {
      double y = h * (0.50 + i * 0.16);
      double r = w * (0.035 + i * 0.015);

      for (int side = 0; side < 2; side++) {
        double x = side == 0 ? w * (0.35 - i * 0.08) : w * (0.65 + i * 0.08);

        canvas.drawOval(
          Rect.fromCenter(center: Offset(x, y), width: r * 2, height: r),
          Paint()..color = const Color(0xFFF6F0E7),
        );

        canvas.drawCircle(
          Offset(x, y),
          r * 0.18,
          Paint()..color = const Color(0xFFD8B982),
        );
      }
    }
  }

  @override
  bool shouldRepaint(HallPainter oldDelegate) {
    return false;
  }
}
