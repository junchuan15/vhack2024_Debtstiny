import 'package:debtstiny/Controller/btm_navi_controller.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class HomeBackBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final User user;

  const HomeBackBar({
    Key? key,
    required this.title,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF152C51),
      leading: IconButton(
        icon: Icon(Icons.arrow_back), 
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => BtmNaviController(index: 0,user: user,),
            ),
          );
        },
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'PT Sans',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
