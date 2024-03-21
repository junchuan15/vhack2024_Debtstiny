import 'package:debtstiny/Pages/navpages/advisorList.dart';
import 'package:flutter/material.dart';


class ConsultPage extends StatelessWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:  EdgeInsets.symmetric(vertical: 100,horizontal: 20),
        children: [
          CustomWidget(
            imagePath: 'lib/Images/img.png',
            title: "Financial Advice",
            description: "Gain insights into personalised financial planning and guidance from finance expert.",
            onPressed: () {
              },
          ),
          SizedBox(height: 20),
          CustomWidget(
            imagePath: 'lib/Images/img_1.png',
            title: "Debt Management",
            description: "Seek advice from an AKPK officer or former DMP debtor about their debt management experience.",
            onPressed: () {
              // Handle onPressed action
            },
          ),
          SizedBox(height: 20),
          CustomWidget(
            imagePath: 'lib/Images/img_2.png',
            title: "Business Planning",
            description: "Businesses or entrepreneurs can seek advice on future business planning from professional experts.",
            onPressed: () {
              // Handle onPressed action
            },
          ),
          SizedBox(height: 20),
          CustomWidget(
            imagePath: 'lib/Images/img_3.png',
            title: "Mental Support",
            description: "Gain encouragement and mental support you need to stay motivated on your journey to financial freedom.",
            onPressed: () {
              // Handle onPressed action
            },
          ),
        ],

      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  // final IconData icon;
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onPressed;

  const CustomWidget({
    Key? key,
    // required this.icon,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card( // Wrap CustomWidget in Card
      elevation: 2, // Set elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20) ),// Set radius

    child: Container(
        color: Colors.white,
        height: 160,
        padding: EdgeInsets.all(20),

          child: Row(
            children: [
              Image.asset(imagePath,width: 70,
                height: 70),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                    Text(description,
                    style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              // SizedBox(width: 10),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdvisorList()), // Replace AdvisorList() with the page you want to navigate to
          );
        },
        // Assign onPressed directly to IconButton's onPressed
        icon: Icon(Icons.arrow_forward_ios,size: 20),
      )],
          ),

    ),
    );
  }
}
