import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'expenses.dart';

class DailyComponent extends StatelessWidget {
  List<Expense> expenses;

  DailyComponent({Key? key,
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
    List<Widget> row = [];
    for(Expense expenses in expenses){
      row.add(
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 80, // Specify the desired width
                  height: 80, // Specify the desired height
                  child: Image.asset(
                    '${icon[expenses.category]}',
                    fit: BoxFit.cover, // Adjust the fit to cover the specified dimensions
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${expenses.description}',
                    style: TextStyle(
                      fontFamily: ('PT Sans'),
                      fontSize: 18,
                    ),),
                    Text('${expenses.category.toString().split('.').last}',
                    style: TextStyle(
                      color: Colors.grey
                    ),)
                ],
              ),
              Spacer(),
              Text('RM ${expenses.amount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontFamily: ('PT Sans'),
                    color: Colors.red
                ),)
          ],
        ),
      ));
    }

    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
              color: Colors.grey[400],
              width: double.infinity,
              height: 2,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 10, bottom: 5),
              height: 40,
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${expenses[0].date.day}',
                      style: TextStyle(
                        fontFamily: ('PT Sans'),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,),),
                    Text('/${expenses[0].date.month}/${expenses[0].date.year}',
                        style: TextStyle(
                          fontFamily: ('PT Sans'),
                          fontSize: 12,
                          color: Colors.grey,))
                  ]
              ),
            ),
            Container(
              color: Colors.grey[400],
              width: double.infinity,
              height: 2,
            ),
            ...row,
            Container(
              color: Colors.grey[400],
              width: double.infinity,
              height: 2,
            ),
          ],
        )
    );
  }
}
