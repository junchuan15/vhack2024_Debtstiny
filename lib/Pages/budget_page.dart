import 'package:debtstiny/Components/custom_appbar.dart';
import 'package:debtstiny/Components/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'budget/budget_daily.dart';
import 'budget/budget_monthly.dart';
import 'budget/expenses.dart';
import 'main_page.dart';

class BudgetPage extends StatefulWidget {
  //final double budget;
  //final List<Expense> expenses;

  const BudgetPage({
    super.key,
    //required this.budget,
    //required this.expenses,
  });

  static double budget = 1500;
  static Expense e1 = Expense(category: ExpenseCategory.Food, description: 'Lunch', amount: 20, date: DateTime.parse('2024-03-17 10:30:00'));
  static Expense e2 = Expense(category: ExpenseCategory.Transportation, description: 'Grab', amount: 15, date: DateTime.parse('2024-03-20 10:30:00'));
  static Expense e3 = Expense(category: ExpenseCategory.Utilities, description: 'Electric', amount: 60, date: DateTime.parse('2024-03-17 10:30:00'));
  static Expense e4 = Expense(category: ExpenseCategory.Food, description: 'Dinner', amount: 24, date: DateTime.parse('2024-02-17 10:30:00'));
  static Expense e5 = Expense(category: ExpenseCategory.Others, description: 'Clothes', amount: 100, date: DateTime.parse('2024-02-18 10:30:00'));
  static List<Expense> expenses = [e1, e2, e3, e4, e5];

  @override
  State<StatefulWidget> createState() {
    return BudgetPageState();
  }
}

class BudgetPageState extends State<BudgetPage>
    with SingleTickerProviderStateMixin {
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
          leading: IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              // Handle menu icon onPressed event
            },
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              color: Colors.white,
              iconSize: 40,
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                // Handle account icon onPressed event
              },
            )
          ],
          backgroundColor: Color.fromRGBO(21, 44, 81, 1),
          title: IconButton(
            onPressed: () {
              _showSetBudgetDialog(context);
            },
            icon: Icon(Icons.account_balance_wallet),
            color: Colors.white,
          ),
          titleSpacing: -10,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 40),
            child: Container(
                child: Column(
              children: [
                TitleBar(text: 'Manage your expenses'),
                Container(
                  color: Colors.white,
                  child: TabBar(
                    indicatorColor: Colors.cyan[700],
                    // Indicator color remains white
                    unselectedLabelColor: Colors.grey[400],
                    // Change unselected label color to grey or any other contrasting color
                    labelColor: Colors.black,
                    // Change selected label color to white
                    tabs: [
                      Tab(
                        child: Text(
                          'Daily',
                          style: TextStyle(
                              fontFamily: ('PT Sans'),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Monthly',
                          style: TextStyle(
                              fontFamily: ('PT Sans'),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                    controller: tabController,
                  ),
                )
              ],
            )),
          ),
        ),
        body: TabBarView(
          children: [
            BudgetDaily(
              budget: BudgetPage.budget,
              expenses: BudgetPage.expenses,
            ),
            BudgetMonthly(),
          ],
          controller: tabController,
        ));
  }

  void _showSetBudgetDialog(BuildContext context) {
    double amount = 0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Set Budget',
                style: TextStyle(
                  fontFamily: ('PT Sans'),
                ),
              ),
              content: TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // Try parsing the input string into a double
                  double? parsedAmount = double.tryParse(value);
                  if (parsedAmount != null) {
                    // If parsing is successful, update the amount variable
                    amount = parsedAmount;
                  } else {
                    // If parsing fails, set amount to 0.0 or handle the error accordingly
                    amount = 0.0;
                  }
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: ('PT Sans'),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(
                          index: 2,
                          budget: amount,
                          expense: BudgetPage.expenses,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontFamily: ('PT Sans'),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
