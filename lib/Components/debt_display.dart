import 'package:debtstiny/Components/debt.dart';
import 'package:debtstiny/Pages/debt_view.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DebtDisplay extends StatelessWidget {
  final Debt debt;
  DebtDisplay({Key? key, required this.debt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DebtView(debt: debt),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.7),
          ),
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
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Image.asset(
                    debt.image_url,
                    width: 80,
                    height: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      debt.creditor,
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF33363F),
                      ),
                      softWrap: true,
                    ),
                    Text(
                      debt.type,
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        color: Color(0xFF33363F),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Balance: RM ${debt.balance.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        color: Color(0xFF33363F),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'APR: ${debt.APR.toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        color: Color(0xFF33363F),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            LinearPercentIndicator(
              animation: true,
              animationDuration: 5000,
              lineHeight: 8,
              percent: debt.progress,
              progressColor: Color(0xFF2B5BA9),
              backgroundColor: Color(0xFFB6B6B6),
            )
          ],
        ),
      ),
    );
  }
}