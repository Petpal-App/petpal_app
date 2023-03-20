import 'package:flutter/material.dart';
import 'package:petpal_app/models/question.dart';
import 'package:petpal_app/screens/category_screen.dart';
import 'package:petpal_app/widgets/video_player.dart';
import 'package:petpal_app/widgets/youtube_player.dart';

class QuizScreen extends StatelessWidget {
  final String category;
  final QuestionList questionList;
  final int index;

  QuizScreen(
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: index < questionList.count - 1
                          ? (context) => QuizScreen(
                              category: category,
                              questionList: questionList,
                              index: index + 1)
                          : (context) => CategoryScreen()),
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
                          ? (context) => QuizScreen(
                              category: category,
                              questionList: questionList,
                              index: index + 1)
                          : (context) => CategoryScreen()),
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
                          ? (context) => QuizScreen(
                              category: category,
                              questionList: questionList,
                              index: index + 1)
                          : (context) => CategoryScreen()),
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
