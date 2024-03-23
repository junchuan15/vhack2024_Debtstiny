import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final double width;

  const Button({
    Key? key,
    required this.onTap,
    required this.title,
    required this.width, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width, 
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: Color(0xFF152C51),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'PT Sans',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

