import 'package:flutter/material.dart';

class RedeemProgressBar extends StatelessWidget {
  const RedeemProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20), 
      child: Center(
        child: Image.asset(
          'lib/Images/redeemprogress.jpg',
          width: 380,
          height: 30,
        ),
      ),
    );
  }
}
