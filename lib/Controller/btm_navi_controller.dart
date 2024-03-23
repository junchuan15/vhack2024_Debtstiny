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
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 153, 232, 243),
        backgroundColor: Color(0xFF052C51),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 10,
        items: const [
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
        selectedLabelStyle: TextStyle(
          fontFamily: 'PT Sans',
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'PT Sans',
        ),
      ),
    );
  }
}
