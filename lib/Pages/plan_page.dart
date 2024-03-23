import 'package:debtstiny/Components/single_plan.dart';
import 'package:debtstiny/Components/title_bar.dart';
import 'package:debtstiny/Pages/debt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:debtstiny/Components/custom_appbar.dart';
import 'package:intl/intl.dart';

import 'plan.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  static List<Debt> debtList = [
    Debt(
        image_url: 'lib/Images/RHB.png',
        creditor: 'RHB Personal Banking',
        type: 'Personal Loan',
        balance: 18300.55,
        APR: 7.19,
        duration: 24,
        paid_off_date: DateTime(2025, 11, 15),
        monthly_payment: 817.34),
    Debt(
        image_url: 'lib/Images/maybank.png',
        creditor: 'Maybank Berhad',
        type: 'Housing Loan',
        balance: 150000,
        APR: 4.35,
        duration: 180,
        paid_off_date: DateTime(2039, 3, 15),
        monthly_payment: 920.74),
    Debt(
        image_url: 'lib/Images/CIMB.png',
        creditor: 'CIMB Bank Berhad',
        type: 'Car Loan',
        balance: 75800,
        APR: 2.85,
        duration: 132,
        paid_off_date: DateTime(2035, 3, 15),
        monthly_payment: 590.61),
    Debt(
        image_url: 'lib/Images/PTPTN.png',
        creditor: 'Perbadanan Tabung Pendidikan Tinggi Nasional',
        type: 'Educational Loan',
        balance: 6700,
        APR: 1,
        duration: 24,
        paid_off_date: DateTime(2026, 3, 15),
        monthly_payment: 281.96)
  ];

  static Plan plan1 = Plan(
      duration: 15,
      paidOffDate: '15 Mar 2039',
      debtList: debtList,
      interest: 73864.34,
      monthly_payment: 2610.65,
      total: 308194.69);

  static Plan plan2 = Plan(
      duration: 18,
      paidOffDate: '15 Mar 2042',
      debtList: [debtList[3], debtList[0], debtList[2], debtList[1]],
      interest: 96148.00,
      monthly_payment: 3015.24,
      total: 401500.00);

  static Plan plan3 = Plan(
      duration: 17,
      paidOffDate: '15 Mar 2041',
      debtList: [debtList[2], debtList[1], debtList[3], debtList[0]],
      interest: 91562.00,
      monthly_payment: 2894.72,
      total: 36425.78);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        secondIcon: IconButton(
            iconSize: 30,
            color: Colors.white,
            icon: Icon(Icons.tune),
            onPressed: () {
              showPlanCustomizationDialog(context, 2500);
            }),
      ),
      backgroundColor: Color(0xFFF3FCF7),
      body: Column(
        children: [
          TitleBar(text: 'Select a repayment plan'),
          Container(
            color: Color(0xFFF3FCF7),
            padding: EdgeInsets.all(20.0),
            // Adjust padding as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    elevation: 6,
                    color: Colors.white,
                    surfaceTintColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey,width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Current Plan',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SinglePlan(
                            plan: plan1,
                          ),
                        ],
                      ),
                    )),
                Text(
                  'Recommended Plan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5,),
                SinglePlan(
                  plan: plan1,
                ),
                SinglePlan(
                  plan: plan2,
                ),
                SinglePlan(
                  plan: plan3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showPlanCustomizationDialog(BuildContext context, double min) {
    String? planPreference;
    double? minMonthlyPayment = min;
    double? maxMonthlyPayment;

    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Customize your plan'),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // Adjust top padding
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Plan Preference',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8), // Add spacing
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.all(0),
                    title: Row(
                      children: [
                        Icon(Icons.access_time), // Clock icon
                        SizedBox(width: 8), // Add spacing
                        Text('Shortest time'),
                      ],
                    ),
                    value: 'Shortest time',
                    groupValue: planPreference,
                    onChanged: (value) {
                      setState(() {
                        planPreference = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.all(0),
                    title: Row(
                      children: [
                        Icon(Icons.attach_money), // Money icon
                        SizedBox(width: 8), // Add spacing
                        Text('Lowest interest'),
                      ],
                    ),
                    value: 'Lowest interest',
                    groupValue: planPreference,
                    onChanged: (value) {
                      setState(() {
                        planPreference = value;
                      });
                    },
                  ),
                  SizedBox(height: 16), // Add spacing
                  Text(
                      'Min Monthly Payment: RM ${formatter.format(minMonthlyPayment)}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8), // Add spacing
                  Text('Set Maximum Monthly Payment: ',
                      style: TextStyle(fontSize: 16)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('RM ', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8), // Add spacing
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            maxMonthlyPayment = double.tryParse(value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter amount',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16), // Add spacing
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    // Add padding only to the right side
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // Align to the end of the row
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(21, 44, 81, 1)),
                          ),
                          onPressed: () {
                            // Handle saving the selected plan preference and max monthly payment
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
