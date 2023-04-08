import 'package:flutter/material.dart';
import 'reminder_card.dart';

class ReminderAnimal extends StatelessWidget {
  final String animal;
  final List<String> wrongAnswers;

  ReminderAnimal({
    required this.animal,
    required this.wrongAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        height: deviceWidth * 0.28,
        width: deviceWidth * 0.4,
        margin: EdgeInsets.symmetric(vertical: deviceWidth * 0.025),
        child: ReminderCard(type: animal, wrongAnswers: wrongAnswers));
  }
}
