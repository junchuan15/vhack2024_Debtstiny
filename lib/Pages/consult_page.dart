import 'package:debtstiny/Components/consult_widget.dart';
import 'package:debtstiny/Components/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../Components/User.dart';

class ConsultPage extends StatelessWidget {
  final User user;

  const ConsultPage({super.key,
    required this.user,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      appBar: CustomAppBar(
        secondIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          ConsultWidget(
            imagePath: 'lib/Images/consult1.png',
            title: "Financial Advice",
            description: "Gain insights into personalised financial planning and guidance from finance expert.",
            onPressed: () {},
            user: user,
          ),
          ConsultWidget(
            imagePath: 'lib/Images/consult2.png',
            title: "Debt Management",
            description: "Seek advice from an AKPK officer or former DMP debtor about their debt management experience.",
            onPressed: () {},
            user: user,
          ),
          ConsultWidget(
            imagePath: 'lib/Images/consult3.png',
            title: "Business Planning",
            description: "Businesses or entrepreneurs can seek advice on future business planning from professional experts.",
            onPressed: () {},
            user: user,
          ),
          ConsultWidget(
            imagePath: 'lib/Images/consult4.png',
            title: "Mental Support",
            description: "Gain encouragement and mental support you need to stay motivated on your journey to financial freedom.",
            onPressed: () {},
            user: user,
          ),
        ],

      ),
    );
  }
}