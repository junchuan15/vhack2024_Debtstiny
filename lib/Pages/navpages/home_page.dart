import 'package:debtstiny/Pages/navpages/consult_page.dart';
import 'package:debtstiny/Pages/navpages/budget_page.dart';
import 'package:debtstiny/Pages/navpages/plan_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Home'),
      )
    );
  }

}
