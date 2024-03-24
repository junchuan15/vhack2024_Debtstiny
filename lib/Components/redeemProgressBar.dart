import 'package:flutter/material.dart';
import 'package:debtstiny/Pages/video_page.dart';

import 'User.dart';


class RedeemProgressBar extends StatelessWidget {
  final User user;
  const RedeemProgressBar({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VideoPage(user: user,)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20), 
        child: Center(
          child: Image.asset(
            'lib/Images/progressbar.jpg',
            width: 380,
            height: 30,
          ),
        ),
      ),
    );
  }
}
