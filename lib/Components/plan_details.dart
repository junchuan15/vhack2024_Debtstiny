import 'package:flutter/material.dart';
import 'package:debtstiny/Components/debt_details.dart';
import 'package:debtstiny/Components/single_plan.dart';
import 'package:debtstiny/Components/top_backBar.dart';
import 'package:intl/intl.dart';

import '../Pages/main_page.dart';
import '../Pages/plan.dart';

class PlanDetails extends StatelessWidget {
  final Plan plan;

  const PlanDetails({
    Key? key,
    required this.plan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');

    return Scaffold(
      appBar: TopBackBar(
        title: 'Plan',
      ),
      backgroundColor: Color(0xFFF3FCF7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: plan.debtList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // First item is SinglePlan widget
                    return SinglePlan(plan: plan);
                  } else {
                    // Rest of the items are DebtDetails widgets
                    return DebtDetails(debt: plan.debtList[index - 1]);
                  }
                },
              ),
            ),
          ),
          Container(
            color: Color(0xFFF3FCF7),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Monthly Payment',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'RM ${formatter.format(plan.total)}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(21, 44, 81, 1)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}