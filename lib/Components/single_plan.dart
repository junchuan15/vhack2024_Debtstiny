import 'package:debtstiny/Components/plan_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Entities/plan.dart';

class SinglePlan extends StatelessWidget {
  final Plan plan;

  const SinglePlan({
    Key? key,
    required this.plan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');

    return GestureDetector(
      onTap: () {
        // Navigate to PlanDetails page when SinglePlan is clicked
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlanDetails(plan: plan,),
        ));
      },
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Text(
              plan.duration.toString() + ' years',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            // Add spacing between duration and paid-off date
            Text(
              '|',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
            ),
            SizedBox(width: 8),
            // Add spacing between duration and paid-off date
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Cleared on '),
                  TextSpan(
                      text: plan.paidOffDate,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ]),
          BankPathway(
            bankPhotoUrls: [
              plan.debtList[0].image_url,
              plan.debtList[1].image_url,
              plan.debtList[2].image_url,
              plan.debtList[3].image_url,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Interest: RM ${formatter.format(plan.interest)}',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'M.Payment: RM ${formatter.format(plan.monthly_payment)}',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

class BankPhoto extends StatelessWidget {
  final String photoUrl;

  const BankPhoto({Key? key, required this.photoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: 110,
        height: 50,
        child: Image.asset(photoUrl));
  }
}

class BankPathway extends StatelessWidget {
  final List<String> bankPhotoUrls;

  const BankPathway({Key? key, required this.bankPhotoUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(4.0), // Adjust padding as needed
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Change color as needed
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _buildBankPhotoWidgets(),
        ),
      ),
    );
  }

  List<Widget> _buildBankPhotoWidgets() {
    List<Widget> widgets = [];
    for (int i = 0; i < bankPhotoUrls.length; i++) {
      widgets.add(BankPhoto(photoUrl: bankPhotoUrls[i]));
      if (i != bankPhotoUrls.length - 1) {
        widgets.add(Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.grey[600],
        )); //Text(' > ', style: TextStyle(fontSize: 24))
      }
    }
    return widgets;
  }
}