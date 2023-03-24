import 'package:flutter/material.dart';
import 'package:petpal_app/screens/reminder_screen.dart';
import '../models/question.dart';
import '../widgets/youtube_player.dart';

class ReminderContentScreen extends StatefulWidget {
  final String category;
  final QuestionList questionList;
  final int index;

  ReminderContentScreen(
      {required this.category,
      required this.questionList,
      required this.index});

  @override
  _ReminderContentScreenState createState() => _ReminderContentScreenState();
}

class _ReminderContentScreenState extends State<ReminderContentScreen> {
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
              ? (context) => ReminderContentScreen(
                  category: widget.category,
                  questionList: widget.questionList,
                  index: widget.index + 1)
              : (context) => ReminderScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${widget.category}'),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkAnswer(0),
              child:
                  Text(widget.questionList.questions[widget.index].options[0]),
            ),
            ElevatedButton(
              onPressed: () => _checkAnswer(1),
              child:
                  Text(widget.questionList.questions[widget.index].options[1]),
            ),
            ElevatedButton(
              onPressed: () => _checkAnswer(2),
              child:
                  Text(widget.questionList.questions[widget.index].options[2]),
            ),
          ],
        ),
      ),
      floatingActionButton: _showModal
          ? FloatingActionButton(
              onPressed: _nextQuestion,
              child: Column(children: [
                Icon(Icons.arrow_forward),
                Text(_isCorrect ? "Correct" : "Wrong")
              ]),
            )
          : null,
    );
  }
}
