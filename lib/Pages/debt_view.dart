import 'package:debtstiny/Components/top_backBar.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Components/debt.dart';
import 'package:intl/intl.dart';

class DebtView extends StatelessWidget {
  final Debt debt;
  final DateFormat dateFormatter = DateFormat('dd MMM yyyy');

  DebtView({Key? key, required this.debt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter=NumberFormat('#,##0.00', 'en_US');

    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      appBar: TopBackBar(
        title: 'View Debt',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    debt.image_url,
                    width: 200,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Description',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Data',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
                rows: [
                  _buildDataRow('Creditor', debt.creditor),
                  _buildDataRow('Type', debt.type),
                  _buildDataRow(
                      'Balance', 'RM ${formatter.format(debt.balance)}'),
                  _buildDataRow('APR', '${debt.APR.toStringAsFixed(2)}%'),
                  _buildDataRow('Duration', '${debt.duration} months'),
                  _buildDataRow('Paid Off Date',
                      dateFormatter.format(debt.paid_off_date)),
                  _buildDataRow('Monthly Payment',
                      'RM ${formatter.format(debt.monthly_payment)}'),
                  _buildDataRow('Progress',
                      '${(debt.progress * 100).toStringAsFixed(2)}%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildDataRow(String title, String value) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            title,
            style: TextStyle(
              fontFamily: 'PT Sans',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        DataCell(
          Text(
            value,
            style: TextStyle(
              fontFamily: 'PT Sans',
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
