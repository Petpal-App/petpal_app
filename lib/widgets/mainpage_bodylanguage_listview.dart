import 'package:flutter/material.dart';

import './question_card_widget.dart';
import '../datas/question_data.dart';

class BodyLanguageListView extends StatelessWidget {
  final double deviceHeight;
  final double deviceWidth;
  final String cardName1;
  final String cardName2;
  final String cardName3;
  final String cardName4;

  BodyLanguageListView({
    required this.deviceHeight,
    required this.deviceWidth,
    required this.cardName1,
    required this.cardName2,
    required this.cardName3,
    required this.cardName4,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        QuestionCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          questionList: dogQuestionList,
          cardName: cardName1,
        ),
        QuestionCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          questionList: catQuestionList,
          cardName: cardName2,
        ),
        QuestionCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          questionList: birdQuestionList,
          cardName: cardName3,
        ),
        QuestionCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          questionList: fishQuestionList,
          cardName: cardName4,
        ),
      ],
    );
  }
}
