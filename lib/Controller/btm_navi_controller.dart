import 'package:flutter/material.dart';
import 'package:debtstiny/Pages/consult_page.dart';
import 'package:debtstiny/Pages/budget_page.dart';
import 'package:debtstiny/Pages/home_page.dart';
import 'package:debtstiny/Pages/plan_page.dart';

import '../Components/User.dart';

class BtmNaviController extends StatefulWidget {
  final int index;
  final User user;

  const BtmNaviController({
    super.key,
    required this.index,
    required this.user,
  });

  @override
  State<StatefulWidget> createState() {
    return _BtmNaviControllerState(index);
  }
}

class _BtmNaviControllerState extends State<BtmNaviController> {
  int currentIndex;

  _BtmNaviControllerState(this.currentIndex);

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = widget.user;
    List pages = [
      HomePage(
        user: user,
      ),
      PlanPage(
        user: user,
      ),
      BudgetPage(
        user: user,
      ),
      ConsultPage(
        user: user,
      ),
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
