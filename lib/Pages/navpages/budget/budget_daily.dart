import 'package:flutter/cupertino.dart';

class BudgetDaily extends StatefulWidget {
  const BudgetDaily({super.key});

  @override
  State<StatefulWidget> createState() {
    return BudgetDailyPage();
  }
}

class BudgetDailyPage extends State<BudgetDaily>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Daily"),
      ),
    );
  }
}