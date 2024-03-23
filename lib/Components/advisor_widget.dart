import 'package:debtstiny/Components/button.dart';
import 'package:debtstiny/Pages/appointment_page.dart';
import 'package:flutter/material.dart';

class AdvisorWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onPressed;

  const AdvisorWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10), 
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'PT Sans',),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'PT Sans',),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.chat_bubble),
                        SizedBox(width: 10),
                        Icon(Icons.call),
                        Spacer(),
                         Button(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppointmentPage(),
                                ),
                              );
                            },
                            title: 'Book',
                            width: 100,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
