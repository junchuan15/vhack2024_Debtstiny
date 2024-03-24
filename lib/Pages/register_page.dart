import 'package:debtstiny/Pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Components/button.dart';
import 'package:debtstiny/Components/text_field.dart';

import '../Components/User.dart';
import '../Components/debt.dart';
import '../Components/debt_progress.dart';
import '../Components/plan.dart';
import '../Controller/btm_navi_controller.dart';
import 'budget/expenses.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedRadio = ''; // Variable to track the selected radio button value

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nricPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void signUpUser() {
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
        ],
      milestone: 0,
    );
    // Implement sign up logic
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BtmNaviController(
          index: 0,
          user: user,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF052C51),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Let’s begin your journey with us!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              // child: Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(
              //       color: Colors.grey,
              //       width: 2,
              //     ),
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(60),
              //       topRight: Radius.circular(60),
              //     ),
              //   ),

              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  MyTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Radio(
                          value: 'NRIC',
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value.toString();
                            });
                          },
                        ),
                        Text('NRIC'),
                        SizedBox(width: 20),
                        Radio(
                          value: 'Passport',
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value.toString();
                            });
                          },
                        ),
                        Text('Passport'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: nricPasswordController,
                    hintText: selectedRadio == 'NRIC' ? 'NRIC' : 'Passport',
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: phoneNumberController,
                    hintText: 'Phone Number',
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Use 12 or more characters with a mix of letters, numbers & symbols',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Button(
                      onTap: signUpUser,
                      title: 'Submit',
                      width: 10,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(width: 4),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF052C51),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
