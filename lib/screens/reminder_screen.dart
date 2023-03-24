import 'package:flutter/material.dart';
import 'package:petpal_app/models/question.dart';
import '../widgets/navbar.dart';
import 'reminder_content_screen.dart';
import '../datas/question_data.dart';

class ReminderScreen extends StatelessWidget {
  static final List<Question> dogQuestions = dogQuestionList.questions
      .where((element) => element.status == 1)
      .toList();
  static final List<Question> catQuestions = catQuestionList.questions
      .where((element) => element.status == 1)
      .toList();
  static final List<Question> birdQuestions = birdQuestionList.questions
      .where((element) => element.status == 1)
      .toList();
  static final List<Question> fishQuestions = catQuestionList.questions
      .where((element) => element.status == 1)
      .toList();
  final QuestionList filteredDogQuestionList =
      new QuestionList(questions: dogQuestions, count: dogQuestions.length);
  final QuestionList filteredCatQuestionList =
      new QuestionList(questions: catQuestions, count: catQuestions.length);
  final QuestionList filteredBirdQuestionList =
      new QuestionList(questions: birdQuestions, count: birdQuestions.length);
  final QuestionList filteredFishQuestionList =
      new QuestionList(questions: fishQuestions, count: fishQuestions.length);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder Categories'),
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
                      builder: (context) => ReminderContentScreen(
                        category: 'Dogs',
                        questionList: filteredDogQuestionList,
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
                      style: TextStyle(fontSize: 60, color: Colors.blue),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReminderContentScreen(
                        category: 'Cats',
                        questionList: filteredCatQuestionList,
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
                      style: TextStyle(fontSize: 60, color: Colors.lightGreen),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReminderContentScreen(
                        category: 'Birds',
                        questionList: filteredBirdQuestionList,
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
                      style: TextStyle(fontSize: 60, color: Colors.orange),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReminderContentScreen(
                        category: 'Fish',
                        questionList: filteredFishQuestionList,
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
                      "Fish",
                      style: TextStyle(fontSize: 60, color: Colors.orange),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 1,
      ),
    );
  }
}
