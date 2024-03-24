enum ExpenseCategory {
  Food,
  Transportation,
  Entertainment,
  Utilities,
  Daily,
  Health,
  Others,
}


class Expense {
  final ExpenseCategory category;
  final String description;
  final double amount;
  final DateTime date;

  final Map<ExpenseCategory, String> icon = {
    ExpenseCategory.Food: 'lib/Images/budget_food.png',
    ExpenseCategory.Daily: 'lib/Images/budget_daily.png',
    ExpenseCategory.Transportation: 'lib/Images/budget_transport.png',
    ExpenseCategory.Entertainment: 'lib/Images/budget_entertainment.png',
    ExpenseCategory.Health: 'lib/Images/budget_health.png',
    ExpenseCategory.Utilities: 'lib/Images/budget_utilities.png',
    ExpenseCategory.Others: 'lib/Images/budget_others.png',
  };

  Expense({
    required this.category,
    required this.description,
    required this.amount,
    required this.date,
  });
}