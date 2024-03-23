import 'package:debtstiny/Components/button_short.dart';
import 'package:debtstiny/Components/quiz.dart';
import 'package:debtstiny/Components/quiz_widget.dart';
import 'package:debtstiny/Components/top_backBar.dart';
import 'package:debtstiny/Pages/score_page.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Quiz> quizzes = [
      Quiz(
        question: 'Which type of debt you should tackle first?',
        choices: [
          'Debt with low annual interest rate',
          'Debt with high annual interest rate'
        ],
        AnswerIndex: 1,
      ),
      Quiz(
        question:
            'Tracking expenditure on a monthly basis is a good way to monitor our budget.',
        choices: ['True', 'False'],
        AnswerIndex: 0,
      ),
      Quiz(
        question: 'Which of the following is a CORRECT spending habits.',
        choices: [
          'Compare price of item from 3 different places before purchasing it.',
          'Buy luxurious items to amaze people.'
        ],
        AnswerIndex: 0,
      ),
      Quiz(
        question: 'What is the first step in debt management.',
        choices: [
          'Increasing your spending and borrowing more money.',
          'Create a personalised debt management plan.'
        ],
        AnswerIndex: 1,
      ),
      Quiz(
        question: 'Which of the following is a way of shortening debt period.',
        choices: [
          'Consistently paying more than the minimum payment  if you can afford to do so.',
          'Continuously making only the minimum payments and never considering paying more.'
        ],
        AnswerIndex: 0,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      appBar: TopBackBar(
        title: 'Milestone 1',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Choose the correct answer.',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PT Sans',
                  fontWeight: FontWeight.bold,
                 color:  Color(0xFF33363F),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Colors.black),
                  SizedBox(width: 8.0),
                  Text(
                    'Reminder: You must score 3/5 to unlock this milestone.',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PT Sans',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                thickness: 1.5,
                color: Color(0xFF33363F),
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < quizzes.length; i++)
                  Column(
                    children: [
                      SizedBox(height: 8.0),
                      QuizWidget(
                        questionIndex: i,
                        quiz: quizzes[i],
                        onAnswerSelected: (selectedAnswerIndex) {},
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 15),
            ButtonShort(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScorePage(),
                  ),
                );
              },
              title: 'Submit',
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
