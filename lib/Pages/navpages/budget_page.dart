import 'package:debtstiny/Components/custom_appbar.dart';
import 'package:debtstiny/Pages/navpages/budget/budget_daily.dart';
import 'package:debtstiny/Pages/navpages/budget/budget_monthly.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BudgetPageState();
  }
}

class BudgetPageState extends State<BudgetPage> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage your expenses'),
        bottom: TabBar(
          indicatorColor: Colors.cyan[700],
          unselectedLabelColor: Colors.grey[600],
          labelColor: Colors.black,
          tabs: [
            Tab(
              text: 'Daily',
            ),
            Tab(
              text: 'Monthly',
            ),
          ],
          controller: tabController,
        ),
      ),
      body: TabBarView(
        children: [
          BudgetDaily(),
          BudgetMonthly(),
        ],
        controller: tabController,
      )
    );
  }
}
