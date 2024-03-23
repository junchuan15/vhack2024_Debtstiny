import 'package:debtstiny/Components/quiz.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final int questionIndex;
  final Quiz quiz;
  final Function(int) onAnswerSelected;

  const QuizWidget({
    Key? key,
    required this.questionIndex,
    required this.quiz,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Question ${questionIndex + 1}: ${quiz.question}',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'PT Sans',
              fontWeight: FontWeight.bold,
              color: Color(0xFF33363F),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChoiceBox(
                choiceIndex: 0,
                choiceText: quiz.choices[0],
                onSelected: () => onAnswerSelected(0),
              ),
              SizedBox(height: 8.0),
              ChoiceBox(
                choiceIndex: 1,
                choiceText: quiz.choices[1],
                onSelected: () => onAnswerSelected(1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChoiceBox extends StatefulWidget {
  final int choiceIndex;
  final String choiceText;
  final VoidCallback onSelected;

  const ChoiceBox({
    Key? key,
    required this.choiceIndex,
    required this.choiceText,
    required this.onSelected,
  }) : super(key: key);

  @override
  _ChoiceBoxState createState() => _ChoiceBoxState();
}

class _ChoiceBoxState extends State<ChoiceBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          if (isSelected) {
            widget.onSelected();
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFD3F4E3) : Colors.transparent,
          border: Border.all(
            color: Color(0xFF33363F),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            isSelected
                ? Icon(Icons.check, color: Colors.black)
                : SizedBox(width: 24),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.choiceText,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PT Sans',
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
