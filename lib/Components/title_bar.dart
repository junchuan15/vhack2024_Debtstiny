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
      color: Color(0xFF152C51),
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
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
