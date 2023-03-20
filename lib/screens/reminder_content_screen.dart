import 'package:flutter/material.dart';
import 'package:petpal_app/models/question.dart';
import 'package:petpal_app/screens/reminder_screen.dart';
import 'package:petpal_app/widgets/youtube_player.dart';

class ReminderContentScreen extends StatelessWidget {
  final String category;
  final QuestionList questionList;
  final int index;

  ReminderContentScreen(
      {required this.category,
      required this.questionList,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - $category'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YoutubePlayerWidget(videoId: questionList.questions[index].videoId),
            SizedBox(height: 20),
            Text(
              questionList.questions[index].questionText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: index < questionList.count - 1
                          ? (context) => ReminderContentScreen(
                              category: category,
                              questionList: questionList,
                              index: index + 1)
                          : (context) => ReminderScreen()),
                );
              },
              child: Text(questionList.questions[index].options[0]),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: index < questionList.count - 1
                          ? (context) => ReminderContentScreen(
                              category: category,
                              questionList: questionList,
                              index: index + 1)
                          : (context) => ReminderScreen()),
                );
              },
              child: Text(questionList.questions[index].options[1]),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: index < questionList.count - 1
                          ? (context) => ReminderContentScreen(
                              category: category,
                              questionList: questionList,
                              index: index + 1)
                          : (context) => ReminderScreen()),
                );
              },
              child: Text(questionList.questions[index].options[2]),
            ),
          ],
        ),
      ),
    );
  }
}
