import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Entities/debt.dart';

class DebtDetails extends StatelessWidget {
  final Debt debt;
  final DateFormat dateFormatter = DateFormat('dd MMM yyyy');

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
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balance:',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'RM ${formatter.format(debt.balance)}',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'APR:',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${debt.APR.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration:',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${debt.duration} months',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Paid off on:',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    dateFormatter.format(debt.paid_off_date),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Monthly Payment:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'RM ${formatter.format(debt.monthly_payment)}',
                    style: TextStyle(
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
