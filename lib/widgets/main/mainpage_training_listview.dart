import 'package:flutter/material.dart';

import '../training/training_guide_card_widget.dart';
import '../../datas/training_guide_data.dart';

class TrainingListView extends StatelessWidget {
  final double deviceHeight;
  final double deviceWidth;
  final String cardName1;
  final String cardName2;
  final String cardName3;
  final String cardName4;

  TrainingListView({
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
        TrainingGuideCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          trainingGuideList: trainingGuideList,
          cardName: cardName1,
        ),
        TrainingGuideCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          trainingGuideList: trainingGuideList,
          cardName: cardName2,
        ),
        TrainingGuideCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          trainingGuideList: trainingGuideList,
          cardName: cardName3,
        ),
        TrainingGuideCard(
          deviceHeight_half: deviceHeight / 2,
          deviceWidth_half: deviceWidth / 1.3,
          trainingGuideList: trainingGuideList,
          cardName: cardName4,
        ),
      ],
    );
  }
}
