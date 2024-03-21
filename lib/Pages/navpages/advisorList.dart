import 'package:debtstiny/Pages/navpages/appointment.dart';
import 'package:flutter/material.dart';

class AdvisorList extends StatelessWidget {
  const AdvisorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Advisor List",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 45,
                child: TextField(
                  style: TextStyle(
                    color: const Color(0xff020202),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                  onChanged: _handleSearch,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xfff1f1f1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: const Color(0xffb2b2b2),
                      fontSize: 20,
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
          SizedBox(height: 20),
          CustomWidget(
            imagePath: 'lib/Images/img_4.png',
            title: "Tan Gwan Tek",
            description: "ABC Company \nFinance Advisor | 5 Years",
            onPressed: () {
              // Handle onPressed action
            },
          ),
          SizedBox(height: 20),
          CustomWidget(
            imagePath: 'lib/Images/img_5.png',
            title: "Muhammad Irfan",
            description: "Comfy Sdn Bhd \nFinance Analyst | 8 Years",
            onPressed: () {
              // Handle onPressed action
            },
          ),
          SizedBox(height: 20),
          CustomWidget(
            imagePath: 'lib/Images/img_6.png',
            title: "Siti Faqri",
            description: "AKPK \nFinance Counselor | 4 Years",
            onPressed: () {
              // Handle onPressed action
            },
          ),
        ],
      ),
    );
  }

  void _handleSearch(String input) {
    // Handle search logic
  }
}

class CustomWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onPressed;

  const CustomWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 50,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.chat_bubble),
                      SizedBox(width: 5),
                      Icon(Icons.call),
                      Spacer(), // To push the next icons to the right end
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Appointment()), // Replace AdvisorList() with the page you want to navigate to
                          );
                        },
                        child: Text(
                          "Book",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2B5BA9)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
