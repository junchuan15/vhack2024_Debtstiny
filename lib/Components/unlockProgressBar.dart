import 'package:flutter/material.dart';

class UnlockProgressBar extends StatelessWidget {
  const UnlockProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Image.asset(
          'lib/Images/unlockbar.jpg',
          width: 380,
          height: 30,
        ),
      ),
    );
  }
}
