import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconButton secondIcon;

  const CustomAppBar({
    Key? key,
    required this.secondIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        iconSize: 30,
        color: Colors.white,
        onPressed: () {
        },
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          color: Colors.white,
          iconSize: 40,
          icon: const Icon(Icons.account_circle),
          onPressed: () {
          },
        )
      ],
      backgroundColor: Color(0xFF152C51),
      title: secondIcon,
      titleSpacing: -10,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
