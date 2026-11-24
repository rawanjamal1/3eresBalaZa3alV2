import 'dart:math' as math;
import 'package:flutter/material.dart';

class TableCard extends StatelessWidget {
  final int number;
  final int seats;
  final int occupied;
  final bool selected;
  final VoidCallback onTap;

  const TableCard({
    super.key,
    required this.number,
    required this.seats,
    required this.occupied,
    required this.selected,
    required this.onTap,
  });

  Widget chair(int index, int count) {
    final angle = (2 * math.pi * index / count) - math.pi / 2;

    final x = 78 + 65 * math.cos(angle);
    final y = 78 + 65 * math.sin(angle);

    return Positioned(
      left: x - 8,
      top: y - 6,
      child: Transform.rotate(
        angle: angle + math.pi / 2,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 450),
          width: 16,
          height: 12,
          decoration: BoxDecoration(
            color: index < occupied
                ? const Color(0xFF27B7B2)
                : const Color(0xFFBFC7D1),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleSeats = math.min(seats, 32);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF214650) : const Color(0xFF12313D),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: selected ? const Color(0xFFD8B982) : const Color(0xFF526B74),
            width: selected ? 2 : 1,
          ),
          boxShadow: [
            if (selected)
              BoxShadow(
                color: const Color(0xFFD8B982).withAlpha(70),
                blurRadius: 18,
              ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    width: 156,
                    height: 156,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        for (int i = 0; i < visibleSeats; i++)
                          chair(i, visibleSeats),

                        Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF0D202B),
                            border: Border.all(color: const Color(0xFFD8B982)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'طاولة $number',
                                style: const TextStyle(
                                  color: Color(0xFFF6F0E7),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '$occupied/$seats',
                                style: const TextStyle(
                                  color: Color(0xFFD8B982),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            if (seats > 32)
              Text(
                'عرض 32 من $seats كرسي',
                style: const TextStyle(color: Color(0xFFC8D2D6), fontSize: 10),
              ),

            Text(
              selected ? 'الطاولة المختارة' : 'اختار الطاولة',
              style: TextStyle(
                color: selected
                    ? const Color(0xFFD8B982)
                    : const Color(0xFFC8D2D6),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
