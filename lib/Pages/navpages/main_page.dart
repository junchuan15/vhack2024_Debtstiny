import 'package:debtstiny/Components/custom_appbar.dart';
import 'package:debtstiny/Pages/navpages/budget/expenses.dart';
import 'package:debtstiny/Pages/navpages/consult_page.dart';
import 'package:debtstiny/Pages/navpages/budget_page.dart';
import 'package:debtstiny/Pages/navpages/home_page.dart';
import 'package:debtstiny/Pages/navpages/plan_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final int index;
  final double budget;
  final List<Expense> expense;

  const MainPage({super.key,
  required this.index,
  required this.budget,
  required this.expense});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState(index);
  }
}

class _MainPageState extends State<MainPage>{
  int currentIndex; // Declare currentIndex as a member variable

  _MainPageState(this.currentIndex); // Constructor to initialize currentIndex
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double budget = widget.budget;
    List pages = [
      HomePage(),
      PlanPage(),
      BudgetPage(budget: budget,expenses: widget.expense,),
      ConsultPage(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.cyan[100],
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