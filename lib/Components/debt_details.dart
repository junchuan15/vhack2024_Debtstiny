import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Components/debt.dart';

class DebtDetails extends StatelessWidget {
  final Debt debt;
  final DateFormat dateFormatter = DateFormat('dd MMM yyyy');
  final TextStyle textStyle = TextStyle(
    fontFamily: 'PT Sans',
    fontSize: 12,
  );

  DebtDetails({Key? key, required this.debt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          debt.image_url,
          width: 110,
          height: 50,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                debt.type,
                style: TextStyle(
                  fontFamily: 'PT Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balance:',
                    style: textStyle,
                  ),
                  Text(
                    'RM ${formatter.format(debt.balance)}',
                    style: textStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'APR:',
                    style: textStyle,
                  ),
                  Text(
                    '${debt.APR.toStringAsFixed(2)}%',
                    style: textStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration:',
                    style: textStyle,
                  ),
                  Text(
                    '${debt.duration} months',
                    style: textStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Paid off on:',
                    style: textStyle,
                  ),
                  Text(
                    dateFormatter.format(debt.paid_off_date),
                    style: textStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Monthly Payment:',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'RM ${formatter.format(debt.monthly_payment)}',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
