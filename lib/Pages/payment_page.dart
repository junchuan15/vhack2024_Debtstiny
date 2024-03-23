import 'package:debtstiny/Components/top_backBar.dart';
import 'package:debtstiny/Pages/payment_done_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isAutoPaymentEnabled = false;

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');
    DateFormat dateFormat = DateFormat('MMMM yyyy');

    return Scaffold(
      appBar: TopBackBar(
        title: 'Pay',
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Activate auto-payment function',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10.0),
                Switch(
                  value: isAutoPaymentEnabled,
                  onChanged: (value) {
                    setState(() {
                      isAutoPaymentEnabled = value;
                    });
                  },
                ),
              ],
            ),
            Text(
                'Your monthly outstanding balance will automatically be paid via your signed credit card on 1st of the month.'),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20),
              elevation: 6,
              color: Colors.white,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          'Monthly Outstanding Balance',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF33363F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'RM ',
                                style: TextStyle(fontSize: 24),
                              ),
                              TextSpan(
                                text: '${formatter.format(1800)}',
                                style: TextStyle(fontSize: 32),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          dateFormat.format(DateTime.now()),
                          style: TextStyle(color: Color(0xFF152C51)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Amount',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF33363F),
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF152C51),
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'RM ',
                        style: TextStyle(fontSize: 24),
                      ),
                      TextSpan(
                        text: '${formatter.format(1800)}',
                        style: TextStyle(fontSize: 32),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(21, 44, 81, 1)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentDonePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Signed Credit Card:',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF33363F),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 40,
                          height: 40,
                          child: Image.asset('lib/Images/creditcard.png'),
                        ),
                        Text(
                          '**** **** **** 1970',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF152C51),
                            shadows: [
                              Shadow(
                                offset:
                                    Offset(2.0, 2.0), // Offset of the shadow
                                blurRadius: 3.0, // Blur radius of the shadow
                                color: Colors.grey
                                    .withOpacity(0.5), // Color of the shadow
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
