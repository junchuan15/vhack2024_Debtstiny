import 'package:debtstiny/Pages/advisor_page.dart';
import 'package:flutter/material.dart';

class ConsultWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onPressed;

  const ConsultWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
        ),
        child: Container(
          color: Colors.white,
          height: 150,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(imagePath, width: 80, height: 80),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'PT Sans',
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PT Sans',
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdvisorPage()),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios, size: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
