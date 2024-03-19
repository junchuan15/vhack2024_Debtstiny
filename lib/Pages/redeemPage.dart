import 'package:flutter/material.dart';
import 'package:debtstiny/Components/top_backBar.dart';
import 'package:debtstiny/Components/scoinBox.dart';

class RedeemPage extends StatefulWidget {
  const RedeemPage({Key? key}) : super(key: key);

  @override
  _RedeemState createState() => _RedeemState();
}

class _RedeemState extends State<RedeemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBackBar(
        title: 'Redeem',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Container(    
        color: Color(0xFFD3F4E3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScoinBox(scoinCount: 993),
          ],
        ),
      ),
    );
  }
}
