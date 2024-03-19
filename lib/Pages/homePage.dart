import 'package:flutter/material.dart';
import 'package:debtstiny/Components/btm_naviBar.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BtmNaviBar(),
    );
  }
}
