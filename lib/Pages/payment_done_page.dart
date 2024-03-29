import 'package:debtstiny/Controller/btm_navi_controller.dart';
import 'package:debtstiny/Components/payment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Components/top_backBar.dart';
import '../Components/User.dart';

class PaymentDonePage extends StatelessWidget {
  final User user;

  const PaymentDonePage({super.key,
    required this.user,});

  static Payment payment = Payment(
      amount: 1800,
      ref_no: 'DBST829190471920',
      dateTime: DateTime(2024, 3, 3, 10, 33, 20),
      trans_type: 'Credit Card Payment',
      coin: 18);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');
    DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');

    return Scaffold(
        appBar: TopBackBar(
          title: 'Pay',
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                width: 150,
                height: 80,
                child: Image.asset('lib/Images/pay_done.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Payment Received',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF33363F),
                  fontFamily: 'PT Sans',
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'RM ${formatter.format(payment.amount)}',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF152C51),
                  fontFamily: 'PT Sans',
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Ref No: ${payment.ref_no}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF152C51),
                  fontFamily: 'PT Sans',
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Date/Time: ${dateFormat.format(payment.dateTime)}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF152C51),
                  fontFamily: 'PT Sans',
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Transaction Type: ${payment.trans_type}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF152C51),
                  fontFamily: 'PT Sans',
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'S-Coins Earned: ${payment.coin}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF152C51),
                  fontFamily: 'PT Sans',
                ),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(21, 44, 81, 1)),
                ),
                onPressed: () {
                  user.debtProgress.mpaid=payment.amount;
                  user.debtProgress.paid+=payment.amount;
                  user.debtProgress.outstanding-=payment.amount;
                  user.debtProgress.remaining=user.debtProgress.total-user.debtProgress.paid;
                  user.debtProgress.progress=double.parse((user.debtProgress.paid/user.debtProgress.total).toStringAsFixed(2));
                  user.debtProgress.scoin+=(payment.amount/100).toInt();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BtmNaviController(index: 0,user: user,),
                    ),
                  );
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'PT Sans',
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
