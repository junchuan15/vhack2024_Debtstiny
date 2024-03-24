import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YearNavigator extends StatefulWidget {
  @override
  _YearNavigatorState createState() => _YearNavigatorState();
}

class _YearNavigatorState extends State<YearNavigator> {
  int currentYear = DateTime.now().year;

  void navigateYear(bool increment) {
    setState(() {
      if (increment) {
        if (currentYear < DateTime.now().year)
          currentYear++;
      } else {
        currentYear--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            navigateYear(false);
          },
        ),
        Text(
          '$currentYear',
          style: TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: Icon(Icons.arrow_right),
          onPressed: () {
            navigateYear(true);
          },
        ),
      ],
    );
  }
}