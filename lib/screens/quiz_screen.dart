import 'package:flutter/material.dart';

import '../models/question.dart';
import '../screens/category_screen.dart';
import '../widgets/youtube_player.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final QuestionList questionList;
  final int index;

  QuizScreen(
      {required this.category,
      required this.questionList,
      required this.index});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool _showModal = false;
  bool _isCorrect = false;

  void _checkAnswer(int selectedIndex) {
    print(selectedIndex);
    if (selectedIndex == 0) {
      _isCorrect = true;
      widget.questionList.questions[widget.index].status = 2;
    } else {
      _isCorrect = false;
      widget.questionList.questions[widget.index].status = 1;
    }
    setState(() {
      _showModal = true;
    });
  }

  void _nextQuestion() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: widget.index < widget.questionList.count - 1
              ? (context) => QuizScreen(
                  category: widget.category,
                  questionList: widget.questionList,
                  index: widget.index + 1)
              : (context) => CategoryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz - ${widget.category}',
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YoutubePlayerWidget(
                videoId: widget.questionList.questions[widget.index].videoId),
            SizedBox(height: 20),
            Text(
              widget.questionList.questions[widget.index].questionText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkAnswer(0),
              child: Text(
                widget.questionList.questions[widget.index].options[0],
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _checkAnswer(1),
              child: Text(
                widget.questionList.questions[widget.index].options[1],
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _checkAnswer(2),
              child: Text(
                widget.questionList.questions[widget.index].options[2],
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _showModal
          ? FloatingActionButton(
              onPressed: _nextQuestion,
              child: Column(children: [
                Icon(Icons.arrow_forward),
                Text(
                  _isCorrect ? "Correct" : "Wrong",
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  ),
                )
              ]),
            )
          : null,
    );
  }
}
