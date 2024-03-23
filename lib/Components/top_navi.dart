import 'package:flutter/material.dart';

class TopNaviBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNaviBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF152C51),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          // Add functionality for the menu button
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Add functionality for the notification button
          },
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            // Add functionality for the profile button
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
