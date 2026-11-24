import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
              const Text(
                'عرس بلا زعل',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'Rakkas',
                  fontSize: 60,
                  color: Color(0xFFF6F0E7),
                ),
              ),
              const SizedBox(height: 15),
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
              const SizedBox(height: 40),
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
            ],
          ),
        ),
      ),
    );
  }
}
