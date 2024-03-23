import 'package:flutter/material.dart';
import 'package:debtstiny/Pages/consult_page.dart';
import 'package:debtstiny/Pages/budget_page.dart';
import 'package:debtstiny/Pages/home_page.dart';
import 'package:debtstiny/Pages/plan_page.dart';

class BtmNaviController extends StatefulWidget {
  const BtmNaviController({Key? key});

  @override
  State<StatefulWidget> createState() {
    return _BtmNaviControllerState();
  }
}

class _BtmNaviControllerState extends State<BtmNaviController> {
  List pages = [
    HomePage(),
    PlanPage(),
    BudgetPage(),
    ConsultPage(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
   Widget build(BuildContext context) {
    List pages = [
      HomePage(),
      PlanPage(),
      BudgetPage(),
      ConsultPage(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.cyan[300],
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 10,
        items: const[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            backgroundColor: Color(0xFF052C51),
          ),
          BottomNavigationBarItem(
            label: 'Plan',
            icon: Icon(Icons.content_paste_search),
            backgroundColor: Color(0xFF052C51),
          ),
          BottomNavigationBarItem(
            label: 'Budget',
            icon: Icon(Icons.wallet),
            backgroundColor: Color(0xFF052C51),
          ),
          BottomNavigationBarItem(
            label: 'Consultation',
            icon: Icon(Icons.person_search),
            backgroundColor: Color(0xFF052C51),
          ),
        ],
      ),
    );
  }

}