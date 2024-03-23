import 'package:debtstiny/Pages/budget/piechart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'expenses.dart';
import 'monthly_component.dart';

class BudgetMonthly extends StatefulWidget {
  const BudgetMonthly({super.key});

  @override
  State<StatefulWidget> createState() {
    return BudgetMonthlyPage();
  }
}

class BudgetMonthlyPage extends State<BudgetMonthly>{
  int currentYear = DateTime.now().year;
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  @override
  Widget build(BuildContext context) {
    Expense e1 = Expense(category: ExpenseCategory.Food, description: 'Lunch', amount: 20, date: DateTime.parse('2024-03-17 10:30:00'));
    Expense e2 = Expense(category: ExpenseCategory.Transportation, description: 'Grab', amount: 15, date: DateTime.parse('2024-03-20 10:30:00'));
    Expense e3 = Expense(category: ExpenseCategory.Utilities, description: 'Electric', amount: 60, date: DateTime.parse('2024-03-17 10:30:00'));
    Expense e4 = Expense(category: ExpenseCategory.Food, description: 'Dinner', amount: 24, date: DateTime.parse('2024-02-17 10:30:00'));
    Expense e5 = Expense(category: ExpenseCategory.Others, description: 'Clothes', amount: 100, date: DateTime.parse('2024-02-18 10:30:00'));
    List<Expense> expenses = [e1, e2, e3, e4, e5];

    List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
    ];

    // Sort expenses based on date
    expenses.sort((a, b) => b.date.compareTo(a.date));

    // Group expenses by month and year
    Map<String, List<Expense>> groupedExpenses = {};

    for (Expense expense in expenses) {
      String monthYearKey = '${expense.date.year}-${expense.date.month}'; // Creating a key using year and month

      if (!groupedExpenses.containsKey(monthYearKey)) {
        groupedExpenses[monthYearKey] = []; // Initialize the list if it doesn't exist
      }

      groupedExpenses[monthYearKey]!.add(expense); // Add the expense to the corresponding month and year
    }

    return Container(
      color: Color(0xFFF3FCF7),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: Expanded(
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_left),
                        onPressed: () {
                          navigateYear(false);
                          selectedYear = currentYear;
                        },
                      ),
                      Text(
                        '$currentYear',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: ('PT Sans'),),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {
                          navigateYear(true);
                          selectedYear = currentYear;
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  DropdownButton<int>(
                    value: selectedMonth,
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedMonth = newValue!;
                      });
                    },
                    items: List.generate(12, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text(months[index],
                        style: TextStyle(fontFamily: ('PT Sans'),),),
                      );
                    }),
                    underline: Container( // remove underline
                      height: 0,
                      color: Colors.transparent,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey[400],
            width: double.infinity,
            height: 2,
          ),
          PieChart(expenses: groupedExpenses['$selectedYear-$selectedMonth']?? []),
          Expanded(
              child: MonthlyComponent(expenses: groupedExpenses['$selectedYear-$selectedMonth']?? []))
        ],
      ),
    );
  }

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
}


