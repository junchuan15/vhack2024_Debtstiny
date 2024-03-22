import 'package:flutter/material.dart';

class ButtonShort extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const ButtonShort({Key? key, required this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 130),
        decoration: BoxDecoration(
          color: Color(0xFF152C51),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'PT Sans',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
