import 'package:debtstiny/Pages/home_page.dart';
import 'package:debtstiny/Pages/redeem_food_page.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Pages/loginPage.dart';
import 'package:debtstiny/Controller/redeem_tab_controller.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RedeemTabController(),
    );
  }
}
