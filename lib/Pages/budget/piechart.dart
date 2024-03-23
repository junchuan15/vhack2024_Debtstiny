import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'expenses.dart';

class PieChart extends StatelessWidget {
  List<Expense> expenses;
  double sum = 0;

  PieChart({Key? key, required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PieChartData> chartData = getChartData();
    return SafeArea(
        child: Container(
      child: SfCircularChart(
        tooltipBehavior: TooltipBehavior(
            enable: true,
            color: Colors.white,
            textStyle: TextStyle(
              color: Colors.black,
              fontFamily: ('PT Sans'),
            )),
        series: <CircularSeries>[
          DoughnutSeries<PieChartData, String>(
            dataSource: chartData,
            xValueMapper: (PieChartData data, _) => data.category,
            yValueMapper: (PieChartData data, _) => data.percent,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            pointColorMapper: (PieChartData data, _) {
              return getCategoryColor(data.category);
            },
          )
        ],
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Center(
              child: Text(
                'RM ${sum.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: ('PT Sans'),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  List<PieChartData> getChartData() {
    Map<ExpenseCategory, double> map = {};
    sum = 0;
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
    List<PieChartData> chartData = [];
    for (ExpenseCategory category in ExpenseCategory.values) {
      double amount =
          map[category] ?? 0; // Get the total amount for the category
      double percent = amount / sum * 100;
      if (amount > 0) {
        // Check if amount is greater than 0
        chartData.add(
            PieChartData(category.toString().split('.').last, percent.ceil()));
      }
    }
    return chartData;
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.red[200]!;
      case 'Transportation':
        return Colors.blue[200]!;
      case 'Entertainment':
        return Colors.orange[200]!;
      case 'Utilities':
        return Colors.yellow[200]!;
      case 'Daily':
        return Colors.purple[200]!;
      case 'Health':
        return Colors.green[200]!;
      case 'Others':
        return Colors.grey[400]!;
      default:
        return Colors.black;
    }
  }
}

class PieChartData {
  final String category;
  final int percent;

  PieChartData(this.category, this.percent);
}
