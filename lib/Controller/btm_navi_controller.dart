import 'package:flutter/material.dart';
import 'package:debtstiny/Pages/consult_page.dart';
import 'package:debtstiny/Pages/budget_page.dart';
import 'package:debtstiny/Pages/home_page.dart';
import 'package:debtstiny/Pages/plan_page.dart';

class BtmNaviController extends StatefulWidget {
  final int index;

  const BtmNaviController({
    super.key,
    required this.index,
  });

  @override
  State<StatefulWidget> createState() {
    return _BtmNaviControllerState(index);
  }
}

class _BtmNaviControllerState extends State<BtmNaviController> {
  List pages = [
    HomePage(),
    PlanPage(),
    BudgetPage(),
    ConsultPage(),
  ];
  int currentIndex;

  _BtmNaviControllerState(this.currentIndex);

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
        unselectedItemColor: Colors.cyan[200],
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            backgroundColor: Color(0xFF152C51),
          ),
          BottomNavigationBarItem(
            label: 'Plan',
            icon: Icon(Icons.content_paste_search),
            backgroundColor: Color(0xFF152C51),
          ),
          BottomNavigationBarItem(
            label: 'Budget',
            icon: Icon(Icons.wallet),
            backgroundColor: Color(0xFF152C51),
          ),
          BottomNavigationBarItem(
            label: 'Consultation',
            icon: Icon(Icons.person_search),
            backgroundColor: Color(0xFF152C51),
          ),
        ],
        selectedLabelStyle: TextStyle(fontFamily: 'PT Sans'),
        unselectedLabelStyle: TextStyle(fontFamily: 'PT Sans'),
      ),
    );
  }
}
