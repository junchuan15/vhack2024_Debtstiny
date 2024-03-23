import 'package:debtstiny/Pages/home_page.dart';
import 'package:debtstiny/Pages/plan_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'budget_page.dart';
import 'consult_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{
  List pages = const[
    HomePage(),
    PlanPage(),
    BudgetPage(),
    ConsultPage(),
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.cyan[600],
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 10,
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
            label: 'Budget',
            icon: Icon(Icons.wallet),
          ),
          BottomNavigationBarItem(
            label: 'Consultation',
            icon: Icon(Icons.person_search),
          ),
        ],
      ),
    );
  }

}