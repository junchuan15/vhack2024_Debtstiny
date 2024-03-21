import 'package:flutter/material.dart';

class bottom_navi extends StatefulWidget{
  const bottom_navi({super.key});
  @override
  State<bottom_navi> createState() => BottomNavBar();
}

class BottomNavBar extends State<bottom_navi>{
  int _currentIndex = 0;
  List<Widget> body = const[
    Icon(Icons.home),
    Icon(Icons.content_paste_search),
    Icon(Icons.wallet),
    Icon(Icons.person_search_outlined),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (int newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Plan',
            icon: Icon(Icons.content_paste_search),
          ),
          BottomNavigationBarItem(
            label: 'Expenses',
            icon: Icon(Icons.wallet),
          ),
          BottomNavigationBarItem(
            label: 'Consult',
            icon: Icon(Icons.person_search_outlined),
          ),
        ],
      ),
    );
  }
}