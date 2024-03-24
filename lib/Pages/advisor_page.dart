import 'package:debtstiny/Components/User.dart';
import 'package:debtstiny/Components/advisor_widget.dart';
import 'package:debtstiny/Components/home_backBar.dart';
import 'package:flutter/material.dart';

class AdvisorPage extends StatelessWidget {
  final User user;
  const AdvisorPage({Key? key, required this.user,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      appBar: HomeBackBar(
        title: 'Financial Advice',
        user: user,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Advisor List",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'PT Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                child: TextField(
                  style: TextStyle(
                    color: const Color(0xff020202),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                  onChanged: _handleSearch,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 234, 235, 231),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: const Color(0xffb2b2b2),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          AdvisorWidget(
            imagePath: 'lib/Images/advisor1.jpg',
            title: "Tan Gwan Tek",
            description: "ABC Company \nFinance Advisor | 5 Years",
            onPressed: () {},
            user: user,
          ),
          AdvisorWidget(
            imagePath: 'lib/Images/advisor2.jpg',
            title: "Muhammad Irfan",
            description: "Comfy Sdn Bhd \nFinance Analyst | 8 Years",
            onPressed: () {},
            user: user,
          ),
          AdvisorWidget(
            imagePath: 'lib/Images/advisor3.jpg',
            title: "Siti Faqri",
            description: "AKPK \nFinance Counselor | 4 Years",
            onPressed: () {},
            user: user,
          ),
        ],
      ),
    );
  }
}

  void _handleSearch(String input) {
  }
