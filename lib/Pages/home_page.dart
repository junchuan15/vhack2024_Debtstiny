import 'package:debtstiny/Components/button.dart';
import 'package:debtstiny/Components/custom_appbar.dart';
import 'package:debtstiny/Components/debt.dart';
import 'package:debtstiny/Components/debt_progress.dart';
import 'package:debtstiny/Controller/debt_display.dart';
import 'package:debtstiny/Controller/redeem_tab_controller.dart';
import 'package:debtstiny/Pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static List<Debt> debtList = [
    Debt(
      image_url: 'lib/Images/RHB.png',
      creditor: 'RHB Personal Banking',
      type: 'Personal Loan',
      balance: 18300.55,
      APR: 7.19,
      duration: 24,
      paid_off_date: DateTime(2025, 11, 15),
      monthly_payment: 817.34,
      progress: 0.57,
    ),
    Debt(
      image_url: 'lib/Images/maybank.png',
      creditor: 'Maybank Berhad',
      type: 'Housing Loan',
      balance: 150000,
      APR: 4.35,
      duration: 180,
      paid_off_date: DateTime(2039, 3, 15),
      monthly_payment: 920.74,
      progress: 0.29,
    ),
    Debt(
      image_url: 'lib/Images/CIMB.png',
      creditor: 'CIMB Bank Berhad',
      type: 'Car Loan',
      balance: 75800,
      APR: 2.85,
      duration: 132,
      paid_off_date: DateTime(2035, 3, 15),
      monthly_payment: 590.61,
      progress: 0.83,
    ),
    Debt(
      image_url: 'lib/Images/PTPTN.png',
      creditor: 'PTPTN',
      type: 'Educational Loan',
      balance: 6700,
      APR: 1,
      duration: 24,
      paid_off_date: DateTime(2026, 3, 15),
      monthly_payment: 281.96,
      progress: 0.69,
    )
  ];

  @override
  Widget build(BuildContext context) {
    DebtProgress debtProgress = DebtProgress(
      remaining: 250800.35,
      outstanding: 1800.00,
      progress: 0.28,
      total: 348300.35,
      paid: 97500.00,
      scoin: 975,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        secondIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height:1400,
          width: 500,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF052C51),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, Jimmy',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '3 Mac 2024',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 90,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Remaining Debt',
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF33363F),
                          ),
                        ),
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "RM",
                            style: TextStyle(
                              fontFamily: 'PT Sans',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF33363F),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    ' ${debtProgress.remaining.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontFamily: 'PT Sans',
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF052C51),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '(Expected Debt Free by July 2030)',
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF33363F),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "RM",
                                  style: TextStyle(
                                    fontFamily: 'PT Sans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF33363F),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          '${debtProgress.outstanding.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontFamily: 'PT Sans',
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Monthly Outstanding Debt',
                                style: TextStyle(
                                  fontFamily: 'PT Sans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF33363F),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Button(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentPage(),
                                ),
                              );
                            },
                            title: 'Pay',
                            width: 120,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 320,
                left: 20,
                right: 10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircularPercentIndicator(
                          animation: true,
                          animationDuration: 5000,
                          radius: 100,
                          lineWidth: 18,
                          percent: 0.28,
                          progressColor: Color(0xFF2B5BA9),
                          backgroundColor: Color(0xFFB6B6B6),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total progress',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'PT Sans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${((debtProgress.progress * 100).toStringAsFixed(0)).toString()}%',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'PT Sans',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF052C51),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Debt',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF33363F),
                              ),
                            ),
                            Text(
                              'RM ${debtProgress.total.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'PT Sans',
                                color: Color(0xFF052C51),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Paid Debt',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF33363F),
                              ),
                            ),
                            Text(
                              'RM ${debtProgress.paid.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'PT Sans',
                                color: Color(0xFF1A7333),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  'lib/Images/Scoin.webp',
                                  width: 35,
                                  height: 35,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'S-Coins',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'PT Sans',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF33363F),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '${debtProgress.scoin.toString()}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'PT Sans',
                                        color: Color(0xFF338095),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Button(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RedeemTabController(),
                                    ),
                                  );
                                },
                                title: 'Redeem',
                                width: 120,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Debts',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF33363F),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 28,
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: HomePage.debtList.length,
                          itemBuilder: (context, index) {
                            return DebtDisplay(debt: HomePage.debtList[index]);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
