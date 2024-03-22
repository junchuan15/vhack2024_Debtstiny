import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String text;

  const TitleBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(21, 44, 81, 1),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
