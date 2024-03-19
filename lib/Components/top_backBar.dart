import 'package:flutter/material.dart';

class TopBackBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const TopBackBar({
    Key? key,
    required this.title,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF152C51),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onBack ?? () => Navigator.of(context).pop(),
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
