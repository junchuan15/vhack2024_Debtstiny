import 'package:debtstiny/Components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Components/top_backBar.dart';
import '../Components/User.dart';
import '../Components/button.dart';
import '../Components/debt.dart';
import '../Controller/btm_navi_controller.dart';

class AddDebt extends StatelessWidget {
  final User user;
  final TextEditingController creditorController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final TextEditingController aprController = TextEditingController();

  AddDebt({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');

    return Scaffold(
      appBar: TopBackBar(
        title: 'Add Debt',
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
        children: <Widget>[
          MyTextField(
            controller: creditorController,
            hintText: 'Creditor',
            obscureText: false,
          ),
          SizedBox(height: 10),
          MyTextField(
            controller: typeController,
            hintText: 'Type',
            obscureText: false,
          ),
          SizedBox(height: 10),
          MyTextField(
            controller: balanceController,
            hintText: 'Balance',
            obscureText: false,
          ),
          SizedBox(height: 10),
          MyTextField(
            controller: aprController,
            hintText: 'APR',
            obscureText: false,
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Button(
              onTap: () {
                addDebt();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BtmNaviController(
                      index: 0,
                      user: user,
                    ),
                  ),
                );
              },
              title: 'Submit',
              width: 10,
            ),
          ),
        ],
      ),
    );
  }

  void addDebt() {
    Debt newDebt = Debt(
      image_url: 'lib/Images/RHB.png',
      creditor: creditorController.text,
      type: typeController.text,
      balance: double.parse(balanceController.text),
      APR: double.parse(aprController.text),
      duration: 24,
      paid_off_date: DateTime(2025, 11, 15),
      monthly_payment: 817.34,
      progress: 0.57,
    );
    user.debtList.add(newDebt);
  }
}
