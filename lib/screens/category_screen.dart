import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/navbar.dart';
import '../widgets/question_card_widget.dart';
import '../widgets/training_guide_card_widget.dart';
import '../datas/question_data.dart';
import '../datas/training_guide_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height - 56;

    final double cardHeight = 5;

    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          child: Text('Category'),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: deviceWidth,
            height: (deviceHeight / 2) - 12,
            //deviceHeight - 4 times margin
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Card(
              elevation: 20,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    child: Text(
                      'Body Language',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.3,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: deviceWidth - 12 * 2,
                    //10 = horizontal padding * 2
                    height: (deviceHeight / 2) - 12 - (10 * 2) - 45 - 4,
                    //width와 height는 deviceHeight를 기준으로 하드코딩 했습니다.
                    //만약에 안되면 pixel4 API 33로 돌려보세요.
                    child: Column(
                      children: [
                        Container(
                          width: deviceWidth - 12 * 2,
                          height: ((deviceHeight / 2) -
                                  12 -
                                  (10 * 2) -
                                  45 -
                                  4 -
                                  4) /
                              2,
                          child: Row(
                            children: [
                              QuestionCard(
                                deviceHeight: deviceHeight,
                                deviceWidth: deviceWidth,
                                questionList: dogQuestionList,
                                cardName: 'Dog',
                              ),
                              QuestionCard(
                                deviceHeight: deviceHeight,
                                deviceWidth: deviceWidth,
                                questionList: catQuestionList,
                                cardName: 'Cat',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: deviceWidth - 12 * 2,
                          height: ((deviceHeight / 2) -
                                  12 -
                                  (10 * 2) -
                                  45 -
                                  4 -
                                  4) /
                              2,
                          child: Row(
                            children: [
                              QuestionCard(
                                deviceHeight: deviceHeight,
                                deviceWidth: deviceWidth,
                                questionList: birdQuestionList,
                                cardName: 'Bird',
                              ),
                              QuestionCard(
                                deviceHeight: deviceHeight,
                                deviceWidth: deviceWidth,
                                questionList: fishQuestionList,
                                cardName: 'Fish',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: deviceWidth,
            height: (deviceHeight / 2) - 12,
            //deviceHeight - 4 times margin
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Card(
              elevation: 20,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    child: Text(
                      'Training',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.3,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: deviceWidth - 12 * 2,
                    //10 = horizontal padding * 2
                    height: (deviceHeight / 2) - 12 - (10 * 2) - 45 - 4,
                    child: Column(
                      children: [
                        Container(
                          width: deviceWidth - 12 * 2,
                          height: ((deviceHeight / 2) -
                                  12 -
                                  (10 * 2) -
                                  45 -
                                  4 -
                                  4) /
                              2,
                          child: Row(
                            children: [
                              TrainingGuideCard(
                                deviceHeight: deviceHeight,
                                deviceWidth: deviceWidth,
                                trainingGuideList: trainingGuideList,
                                cardName: 'Dog',
                              ),
                              TrainingGuideCard(
                                deviceHeight: deviceHeight,
                                deviceWidth: deviceWidth,
                                trainingGuideList: trainingGuideList,
                                cardName: 'Cat',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: deviceWidth - 12 * 2,
                          height: ((deviceHeight / 2) -
                                  12 -
                                  (10 * 2) -
                                  45 -
                                  4 -
                                  4) /
                              2,
                          child: Row(
                            children: [
                              TrainingGuideCard(
                                deviceHeight: deviceHeight,
                                deviceWidth: deviceWidth,
                                trainingGuideList: trainingGuideList,
                                cardName: 'Bird',
                              ),
                              TrainingGuideCard(
                                deviceHeight: deviceHeight,
                                deviceWidth: deviceWidth,
                                trainingGuideList: trainingGuideList,
                                cardName: 'Fish',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 0,
      ),
    );
  }
}
