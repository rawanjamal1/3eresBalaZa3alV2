import 'dart:math' as math;
import 'package:flutter/material.dart';

class Rings extends StatelessWidget {
  final Animation<double> animation;

  const Rings({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        double progress = const Interval(
          0.42,
          0.74,
          curve: Curves.easeOutCubic,
        ).transform(animation.value);

        double sparkle = const Interval(
          0.74,
          0.89,
        ).transform(animation.value);

        return Opacity(
          opacity: (progress * 4).clamp(0.0, 1.0).toDouble(),
          child: CustomPaint(
            size: const Size(280, 160),
            painter: RingsPainter(progress, sparkle),
          ),
        );
      },
    );
  }
}

class RingsPainter extends CustomPainter {
  final double progress;
  final double sparkle;

  RingsPainter(this.progress, this.sparkle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    final distance = 88 - (63 * progress);

    final silver = center + Offset(-distance, 0);
    final gold = center + Offset(distance, 0);

    final silverPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..shader = const SweepGradient(
        colors: [
          Color(0xFF738A96),
          Color(0xFFF6F0E7),
          Color(0xFF738A96),
        ],
      ).createShader(
        Rect.fromCircle(center: silver, radius: 40),
      );

    final goldPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..shader = const SweepGradient(
        colors: [
          Color(0xFF987344),
          Color(0xFFF6E1B3),
          Color(0xFF987344),
        ],
      ).createShader(
        Rect.fromCircle(center: gold, radius: 40),
      );

    canvas.drawCircle(silver, 40, silverPaint);
    canvas.drawCircle(gold, 40, goldPaint);

    if (distance < 40) {
      final angle = -math.acos(distance / 40);

      canvas.drawArc(
        Rect.fromCircle(center: silver, radius: 40),
        angle - 0.25,
        0.5,
        false,
        silverPaint,
      );
    }

    final diamond = Path()
      ..moveTo(gold.dx - 12, gold.dy - 43)
      ..lineTo(gold.dx - 6, gold.dy - 52)
      ..lineTo(gold.dx + 6, gold.dy - 52)
      ..lineTo(gold.dx + 12, gold.dy - 43)
      ..lineTo(gold.dx, gold.dy - 30)
      ..close();

    canvas.drawPath(
      diamond,
      Paint()..color = const Color(0xFF123B45),
    );

    canvas.drawPath(
      diamond,
      Paint()
        ..color = const Color(0xFFD8B982)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    drawStar(canvas, center + const Offset(-105, -40));
    drawStar(canvas, center + const Offset(105, -45));
    drawStar(canvas, center + const Offset(95, 50));
  }

  void drawStar(Canvas canvas, Offset center) {
    double radius = 8 * sparkle;

    final path = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx + 2 * sparkle, center.dy - 2 * sparkle)
      ..lineTo(center.dx + radius, center.dy)
      ..lineTo(center.dx + 2 * sparkle, center.dy + 2 * sparkle)
      ..lineTo(center.dx, center.dy + radius)
      ..lineTo(center.dx - 2 * sparkle, center.dy + 2 * sparkle)
      ..lineTo(center.dx - radius, center.dy)
      ..lineTo(center.dx - 2 * sparkle, center.dy - 2 * sparkle)
      ..close();

    canvas.drawPath(
      path,
      Paint()..color = const Color(0xFFD8B982),
    );
  }

  @override
  bool shouldRepaint(RingsPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.sparkle != sparkle;
  }
}