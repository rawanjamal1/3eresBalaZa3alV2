import 'package:flutter/material.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عرس بلا زعل',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Alexandria'),
      home: const Welcome(),
    );
  }
}
