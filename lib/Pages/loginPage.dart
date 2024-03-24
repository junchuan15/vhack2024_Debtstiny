import 'package:debtstiny/Components/User.dart';
import 'package:debtstiny/Pages/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Controller/btm_navi_controller.dart';
import 'package:debtstiny/Components/button.dart';
import 'package:debtstiny/Components/text_field.dart';

import '../Components/debt.dart';
import '../Components/debt_progress.dart';
import '../Components/plan.dart';
import 'budget/expenses.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User user = User(
        name: 'Jimmy',
        email: 'jimmy@gmail.com',
        password: 'jimmy123',
        debtProgress: DebtProgress(
          remaining: 250800.35,
          outstanding: 1800.00,
          mpaid: 0.00,
          progress: 0.28,
          total: 348300.35,
          paid: 97500.00,
          scoin: 975,
        ),
        plan: Plan(
            duration: 15,
            paidOffDate: '15 Mar 2039',
            debtList: [
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
            ],
            interest: 73864.34,
            monthly_payment: 2610.65,
            total: 308194.69),
        debtList: [
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
        ],
        budget: 1500,
        expenses: [
          Expense(
              category: ExpenseCategory.Food,
              description: 'Lunch',
              amount: 20,
              date: DateTime.parse('2024-03-17 10:30:00')),
          Expense(
              category: ExpenseCategory.Transportation,
              description: 'Grab',
              amount: 15,
              date: DateTime.parse('2024-03-20 10:30:00')),
          Expense(
              category: ExpenseCategory.Utilities,
              description: 'Electric',
              amount: 60,
              date: DateTime.parse('2024-03-17 10:30:00')),
          Expense(
              category: ExpenseCategory.Food,
              description: 'Dinner',
              amount: 24,
              date: DateTime.parse('2024-02-17 10:30:00')),
          Expense(
              category: ExpenseCategory.Others,
              description: 'Clothes',
              amount: 100,
              date: DateTime.parse('2024-02-18 10:30:00')),
        ]);

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xFFD3F4E3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'lib/Images/logo-s.png',
                    width: 300,
                    height: 275,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Color(0xFF052C51),
                                  fontFamily: 'PT Sans',
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Welcome back! Nice to see you again.',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 25),
                            MyTextField(
                              controller: usernameController,
                              hintText: 'Email',
                              obscureText: false,
                            ),
                            SizedBox(height: 10),
                            MyTextField(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Button(
                              onTap: () {
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
                              title: 'Login',
                              width: 300,
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 4),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Register now',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xFF052C51),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
