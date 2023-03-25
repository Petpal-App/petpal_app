import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../screens/guide_screen.dart';
import '../models/training_guide.dart';

class TrainingGuideCard extends StatelessWidget {
  final double deviceHeight_half;
  final double deviceWidth_half;
  final TrainingGuideList trainingGuideList;
  final String cardName;

  TrainingGuideCard({
    required this.deviceHeight_half,
    required this.deviceWidth_half,
    required this.trainingGuideList,
    required this.cardName,
  });

  //question card의 training버전이에요

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (deviceWidth_half - 12 * 2 - 4) / 2, //deviceWidth_half - 12 * 2,
      height: ((deviceHeight_half / 2) - 12 - (10 * 2) - 45 - 4 - 4) / 2 - 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 10,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GuideScreen(
                  category: cardName,
                  trainingGuideList: trainingGuideList,
                  index: 0,
                  deviceHeight_half: deviceHeight_half,
                ),
              ),
            );
          },
          child: Align(
            alignment: Alignment.center,
            child: Container(
              //padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                cardName,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontFamily:
                      Theme.of(context).textTheme.headlineLarge?.fontFamily,
                ),
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        ),
      ),
    );
  }
}
