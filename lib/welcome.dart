import 'package:flutter/material.dart';
import 'components/rings.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget animate(Widget child, double start, double end) {
    final animation = controller.drive(CurveTween(curve: Interval(start, end)));

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.8),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF123B45), Color(0xFF0D202B), Color(0xFF091820)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              animate(
                const Text(
                  'عرس بلا زعل',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Rakkas',
                    fontSize: 60,
                    color: Color(0xFFF6F0E7),
                  ),
                ),
                0.0,
                0.16,
              ),
              const SizedBox(height: 15),
              animate(
                const Text(
                  'رتّب معازيمك لتفادي الدراما العائلية',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'ElMessiri',
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color(0xFFD8B982),
                  ),
                ),
                0.20,
                0.36,
              ),
              const SizedBox(height: 20),

              Rings(animation: controller),

              const SizedBox(height: 20),
              animate(
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD8B982),
                    foregroundColor: const Color(0xFF0D202B),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 18,
                    ),
                  ),
                  child: const Text(
                    'يلا نرتّب العرس',
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                0.91,
                1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
