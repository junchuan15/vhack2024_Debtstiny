import 'package:debtstiny/Components/debt.dart';
import 'package:debtstiny/Components/plan.dart';
import 'package:debtstiny/Pages/budget/expenses.dart';

import 'debt_progress.dart';

class User {
  String _name;
  String _email;
  String _password;
  DebtProgress _debtProgress;
  Plan _plan;
  List<Debt> _debtList;
  double _budget;
  List<Expense> _expenses;

  User({
    required String name,
    required String email,
    required String password,
    required DebtProgress debtProgress,
    required Plan plan,
    required List<Debt> debtList,
    required double budget,
    required List<Expense> expenses,
  })  : _name = name,
        _email = email,
        _password = password,
        _debtProgress = debtProgress,
        _plan = plan,
        _debtList = debtList,
        _budget = budget,
        _expenses = expenses;

  // Getter methods
  String get name => _name;
  String get email => _email;
  String get password => _password;
  DebtProgress get debtProgress => _debtProgress;
  Plan get plan => _plan;
  List<Debt> get debtList => _debtList;
  double get budget => _budget;
  List<Expense> get expenses => _expenses;

  // Setter methods
  set name(String name) {
    _name = name;
  }

  set email(String email) {
    _email = email;
  }

  set password(String password) {
    _password = password;
  }

  set debtProgress(DebtProgress debtProgress) {
    _debtProgress = debtProgress;
  }

  set plan(Plan plan) {
    _plan = plan;
  }

  set debtList(List<Debt> debtList) {
    _debtList = debtList;
  }

  set budget(double budget) {
    _budget = budget;
  }

  set expenses(List<Expense> expenses) {
    _expenses = expenses;
  }
}
