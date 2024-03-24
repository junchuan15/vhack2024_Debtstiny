import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: hintText,
          labelStyle: TextStyle(color: Color(0xFF052C51)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF052C51)), // Border color when focused
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF052C51)), // Border color when not focused
          ),
        ),
      ),
    );
  }
}
