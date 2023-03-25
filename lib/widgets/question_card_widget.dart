import 'package:flutter/material.dart';
import '../screens/quiz_screen.dart';
import '../models/question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionCard extends StatelessWidget {
  final double deviceHeight_half;
  final double deviceWidth_half;
  final QuestionList questionList;
  final String cardName;

  QuestionCard({
    required this.deviceHeight_half,
    required this.deviceWidth_half,
    required this.questionList,
    required this.cardName,
  });

  void getQuestions(firestore) async {
    QuerySnapshot querySnapshot = await firestore.collection('questions').get();
    List<DocumentSnapshot> documents = querySnapshot.docs;
    for (DocumentSnapshot document in documents) {
      print(document.data());
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    getQuestions(firestore);

    return Container(
      width: (deviceWidth_half - 12 * 2 - 4) / 2,
      height: ((deviceHeight_half / 2) - 12 - (10 * 2) - 45 - 4 - 4) / 2 - 2,
      //위 두 부분은 하드코딩했어요. 나중에 위젯당 2픽셀의 패딩을 기본으로 가지는거 처리하면 돼요.
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
                builder: (context) => QuizScreen(
                  category: cardName,
                  questionList: questionList,
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
