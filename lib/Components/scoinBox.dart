import 'package:flutter/material.dart';

class ScoinBox extends StatelessWidget {
  final int scoinCount; // Define a variable to hold the number of S-coins

  const ScoinBox({Key? key, required this.scoinCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'lib/Images/Scoin.webp',
              width: 90,
              height: 90,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    scoinCount.toString(),
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color(0xFF338095),
                    ),
                  ),
                  SizedBox(width: 8),
                  const Text(
                    'S-Coins',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF33363F),
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'RM100.00 = 1 S-Coin',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'PT Sans',
                  color: Color(0xFF152C51),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
