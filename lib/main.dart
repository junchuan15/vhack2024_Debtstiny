import 'package:debtstiny/Pages/plan_page.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlanPage(),
    );
  }
}
