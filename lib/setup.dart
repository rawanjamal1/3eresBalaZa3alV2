import 'package:flutter/material.dart';

class Setup extends StatelessWidget {
  const Setup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D202B),
      appBar: AppBar(
        title: const Text('هندسة المعازيم'),
        backgroundColor: const Color(0xFF123B45),
        foregroundColor: const Color(0xFFD8B982),
      ),
      body: const Center(
        child: Text(
          'أول خطوة لعرس بلا مشاكل.',
          style: TextStyle(
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Color(0xFFD8B982),
          ),
        ),
      ),
    );
  }
}
