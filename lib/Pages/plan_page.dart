import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3F4E3),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.menu)),
                IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.tune)),
              ],
            ),
            actions: [
              IconButton(
                color: Colors.white,
                iconSize: 40,
                icon: const Icon(Icons.account_circle),
                onPressed: () {},
              )
            ],
            backgroundColor: Color.fromRGBO(21, 44, 81, 1),
            title: Text(
              'Select a repayment plan',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.all(16.0), // Adjust padding as needed
              padding: EdgeInsets.all(8.0), // Adjust padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Content Below AppBar',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0), // Add some vertical spacing
                  Text(
                    'Additional information or content goes here.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

