import 'package:flutter/material.dart';
import 'package:petpal_app/main.dart';
import '../../models/bodylang/bodylang_question.dart';
import '../../models/bodylang/bodylang_question_model.dart';
import '../../screens/bodylang/quiz_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionCard extends StatelessWidget {
  final double deviceHeight_half;
  final double deviceWidth_half;
  final String cardName;
  final String type;

  QuestionCard({
    required this.deviceHeight_half,
    required this.deviceWidth_half,
    required this.cardName,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> questionStream = FirebaseFirestore.instance
        .collection('questions')
        .where('type', isEqualTo: type)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: questionStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return Text('Loading...');
        }

        List<Question> questions = snapshot.data!.docs.map((doc) {
          return Question(
            questionText: doc['questionText'],
            options: List<String>.from(doc['options']),
            type: doc['type'],
            videoId: doc['videoId'],
            id: doc['id'],
          );
        }).toList();

        return Container(
          width: (deviceWidth_half - 12 * 2 - 4) / 2,
          height:
              ((deviceHeight_half / 2) - 12 - (10 * 2) - 45 - 4 - 4) / 2 - 2,
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
                      questionList: new QuestionList(
                          questions: questions, count: questions.length),
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
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.greenTambourineTransparent,
                foregroundColor: AppColor.yellowColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
