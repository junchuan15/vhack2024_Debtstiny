import 'package:debtstiny/Controller/btm_navi_controller.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Components/debt_details.dart';
import 'package:debtstiny/Components/single_plan.dart';
import 'package:debtstiny/Components/top_backBar.dart';
import 'package:intl/intl.dart';
import '../Components/User.dart';
import '../Components/plan.dart';

class PlanDetailsPage extends StatelessWidget {
  final Plan plan;
  final User user;

  const PlanDetailsPage({
    Key? key,
    required this.plan,
    required this.user,
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
                    return SinglePlan(plan: plan,user: user,);
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
                      'Total',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PT Sans',
                      ),
                    ),
                    Text(
                      'RM ${formatter.format(plan.total)}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PT Sans',
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
                    user.plan=this.plan;
                    user.debtProgress.total=this.plan.total;
                    user.debtProgress.outstanding=plan.monthly_payment-user.debtProgress.mpaid;
                    user.debtProgress.remaining=user.debtProgress.total-user.debtProgress.paid;
                    user.debtProgress.progress=double.parse((user.debtProgress.paid/user.debtProgress.total).toStringAsFixed(2));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BtmNaviController(index: 0,user: user,),
                      ),
                    );
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'PT Sans',
                      fontWeight: FontWeight.bold,
                    ),
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
