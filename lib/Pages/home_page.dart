import 'package:debtstiny/Components/button.dart';
import 'package:debtstiny/Components/custom_appbar.dart';
import 'package:debtstiny/Pages/pay_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              height: 166,
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
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' 250,800.35',
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
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' 1,800.00',
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
                                builder: (context) => PayPage(),
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
          ],
        ),
      ),
    );
  }
}