import 'package:debtstiny/Pages/navpages/budget/expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonthlyComponent extends StatelessWidget {
  List<Expense> expenses;

  MonthlyComponent({Key? key,
    required this.expenses}) : super(key: key);

  Map<ExpenseCategory, String> icon = {
    ExpenseCategory.Food: 'lib/Images/budget_food.png',
    ExpenseCategory.Daily: 'lib/Images/budget_daily.png',
    ExpenseCategory.Transportation: 'lib/Images/budget_transport.png',
    ExpenseCategory.Entertainment: 'lib/Images/budget_entertainment.png',
    ExpenseCategory.Health: 'lib/Images/budget_health.png',
    ExpenseCategory.Utilities: 'lib/Images/budget_utilities.png',
    ExpenseCategory.Others: 'lib/Images/budget_others.png',
  };

  @override
  Widget build(BuildContext context) {
    List<MonthlyData> data = getMonthlyData();
    List<Widget> row = [];
    for(MonthlyData data in data){
      row.add(
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 64, // Specify the desired width
                  height: 64, // Specify the desired height
                  child: Image.asset(
                    '${icon[data.category]}',
                    fit: BoxFit.cover, // Adjust the fit to cover the specified dimensions
                  ),
                ),
                Text('${data.category.toString().split('.').last}',
                style: TextStyle(
                    fontFamily: ('PT Sans')
                ),),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: getCategoryColor(data.category).withOpacity(0.5), // Adjust opacity here
                    borderRadius: BorderRadius.circular(10), // Adjust border radius here
                  ),
                  child: Text('${data.percent} %'),
                ),
                SizedBox(width: 10),
                Text('RM ${data.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: ('PT Sans')
                  ),)
              ],
            ),
          ));
    }

    return ListView.builder(
        itemCount: row.length,
        itemBuilder: (context, index){
          return row[index];
        });
  }

  List<MonthlyData> getMonthlyData(){
    Map<ExpenseCategory, double> map = {};
    double sum = 0;
    for (Expense expense in expenses) {
      ExpenseCategory category = expense.category;
      if (!map.containsKey(category)) {
        map[category] = expense.amount;
      } else {
        // Update the total amount for the category
        map[category] = (map[category] ?? 0) + expense.amount;
      }
      sum += expense.amount;
    }
    List<MonthlyData> monthlyData = [];
    for(ExpenseCategory category in ExpenseCategory.values){
      double amount = map[category] ?? 0; // Get the total amount for the category
      double percent = amount/sum * 100;
      if (amount > 0) { // Check if amount is greater than 0
        monthlyData.add(MonthlyData(category, percent.ceil(), amount));
      }
    }
    return monthlyData;
  }

  Color getCategoryColor(ExpenseCategory category) {
    switch (category) {
      case ExpenseCategory.Food:
        return Colors.red[200]!;
      case ExpenseCategory.Transportation:
        return Colors.blue[200]!;
      case ExpenseCategory.Entertainment:
        return Colors.orange[200]!;
      case ExpenseCategory.Utilities:
        return Colors.yellow[200]!;
      case ExpenseCategory.Daily:
        return Colors.purple[200]!;
      case ExpenseCategory.Health:
        return Colors.green[200]!;
      case ExpenseCategory.Others:
        return Colors.grey[400]!;
      default:
        return Colors.black;
    }
  }
}

class MonthlyData{
  final ExpenseCategory category;
  final int percent;
  final double amount;

  MonthlyData(this.category, this.percent, this.amount);
}