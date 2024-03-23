import 'package:debtstiny/Pages/navpages/budget/expenses.dart';
import 'package:debtstiny/Pages/navpages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double budget = 1500;
    Expense e1 = Expense(category: ExpenseCategory.Food, description: 'Lunch', amount: 20, date: DateTime.parse('2024-03-17 10:30:00'));
    Expense e2 = Expense(category: ExpenseCategory.Transportation, description: 'Grab', amount: 15, date: DateTime.parse('2024-03-20 10:30:00'));
    Expense e3 = Expense(category: ExpenseCategory.Utilities, description: 'Electric', amount: 60, date: DateTime.parse('2024-03-17 10:30:00'));
    Expense e4 = Expense(category: ExpenseCategory.Food, description: 'Dinner', amount: 24, date: DateTime.parse('2024-02-17 10:30:00'));
    Expense e5 = Expense(category: ExpenseCategory.Others, description: 'Clothes', amount: 100, date: DateTime.parse('2024-02-18 10:30:00'));
    List<Expense> expenses = [e1, e2, e3, e4, e5];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(index: 0,budget: budget,expense: expenses,),
    );
  }
}
