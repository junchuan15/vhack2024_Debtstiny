import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconButton secondIcon;

  const CustomAppBar({
    Key? key,
    required this.secondIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(
        children: <Widget>[
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: IconButton(
              iconSize: 30,
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: secondIcon,
          ),
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
