import 'package:flutter/material.dart';

import '../bodylang/bodylang_question_card_widget.dart';
import '../../datas/bodylang_question_data.dart';

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
          type: "dog",
          cardName: cardName1,
        ),
        QuestionCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          type: "cat",
          cardName: cardName2,
        ),
        QuestionCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          type: "bird",
          cardName: cardName3,
        ),
        QuestionCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          type: "fish",
          cardName: cardName4,
        ),
      ],
    );
  }
}
