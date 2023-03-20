import 'package:flutter/material.dart';
import 'package:petpal_app/models/question.dart';
import '../widgets/navbar.dart';
import 'quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  final QuestionList questionList = (new QuestionList(questions: [
    new Question(
        id: 1,
        questionText: "문제 1",
        options: ["정답", "오답", "오답"],
        videoId: "A2-8IDBl6bk"),
    new Question(
        id: 2,
        questionText: "문제 2",
        options: ["정답", "오답", "오답"],
        videoId: "A2-8IDBl6bk"),
    new Question(
        id: 3,
        questionText: "문제 3",
        options: ["정답", "오답", "오답"],
        videoId: "A2-8IDBl6bk")
  ], count: 3));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        category: 'Dogs',
                        questionList: questionList,
                        index: 0,
                      ),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Dogs",
                      style: TextStyle(fontSize: 60, color: Colors.white),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        category: 'Cats',
                        questionList: questionList,
                        index: 0,
                      ),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Cats",
                      style: TextStyle(fontSize: 60, color: Colors.white),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        category: 'Birds',
                        questionList: questionList,
                        index: 0,
                      ),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Birds",
                      style: TextStyle(fontSize: 60, color: Colors.white),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 0,
      ),
    );
  }
}
