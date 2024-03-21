import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconButton secondIcon;

  const CustomAppBar({
    super.key,
    required this.secondIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          secondIcon,
        ],
      ),
      actions: [
        IconButton(
          color: Colors.white,
          iconSize: 40,
          icon: const Icon(Icons.account_circle),
          onPressed: () {},
        )
      ],
      backgroundColor: Color.fromRGBO(21, 44, 81, 1),
    );
  }
}
