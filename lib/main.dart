import 'package:debtstiny/Pages/navpages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Pages/login_page.dart';

import 'Pages/navpages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage()
    );
  }
}
