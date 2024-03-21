import 'package:flutter/cupertino.dart';

class BudgetMonthly extends StatefulWidget {
  const BudgetMonthly({super.key});

  @override
  State<StatefulWidget> createState() {
    return BudgetMonthlyPage();
  }
}

class BudgetMonthlyPage extends State<BudgetMonthly>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Monthly"),
      ),
    );
  }
}