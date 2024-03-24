import 'package:debtstiny/Components/User.dart';
import 'package:debtstiny/Components/button_short.dart';
import 'package:debtstiny/Components/top_backBar.dart';
import 'package:debtstiny/Controller/unlock_controller.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final User user;

  const ScorePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      appBar: TopBackBar(
        title: 'Milestone 1',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 180.0),
              Text(
                'Your Score is 5/5',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  fontFamily: 'PT Sans',
                  color: Color(0xFF33363F),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'lib/Images/excellent.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 10),
              Text(
                'Milestone 1 Unlocked',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'PT Sans',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF33363F),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'You can now redeem products with your S-Coins',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'PT Sans',
                  color: const Color.fromARGB(255, 31, 31, 31),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 70.0),
              ButtonShort(
                onTap: () {
                  user.milestone+=1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UnlockController(
                        user: user,
                      ),
                    ),
                  );
                },
                title: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
