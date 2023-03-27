import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petpal_app/main.dart';
import 'package:petpal_app/models/question.dart';
import 'package:petpal_app/models/question_model.dart';
import 'package:petpal_app/screens/reminder_content_screen.dart';
import 'package:petpal_app/widgets/button_content.dart';

class ReminderCard extends StatelessWidget {
  final String type;
  final List<String> wrongAnswers;

  void moveToReminderScreen({
    required BuildContext context,
    required String type,
    required QuestionList questionList,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReminderContentScreen(
          category: type,
          questionList: questionList,
          index: 0,
        ),
      ),
    );
  }

  ReminderCard({required this.type, required this.wrongAnswers});

  @override
  Widget build(BuildContext context) {
    if (wrongAnswers.isEmpty) {
      return Card(
        elevation: 5,
        child: ElevatedButton(
          onPressed: () => {},
          child: ButtonContent(
            type: type,
            colors: Colors.blue,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.greenTambourineTransparent,
            side: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
      );
    }
    final Stream<QuerySnapshot> questionStream = FirebaseFirestore.instance
        .collection('questions')
        .where('type', isEqualTo: type)
        .where('id', whereIn: wrongAnswers.map((id) => int.parse(id)))
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
          return Card(
            elevation: 5,
            child: ElevatedButton(
              onPressed: () => moveToReminderScreen(
                  context: context,
                  type: type,
                  questionList: new QuestionList(
                      questions: questions, count: questions.length)),
              child: ButtonContent(
                type: type,
                colors: Colors.blue,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.greenTambourineTransparent,
                side: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
          );
        });
  }
}
