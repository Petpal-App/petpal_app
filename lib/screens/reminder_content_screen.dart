import 'package:flutter/material.dart';
import 'package:petpal_app/screens/reminder_screen.dart';
import '../models/question.dart';
import '../widgets/youtube_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void _checkAnswer(int selectedIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final id = widget.questionList.questions[widget.index].id;
    if (selectedIndex == 0) {
      _isCorrect = true;
      List<String>? wrongAnswers = prefs.getStringList('wrong_answers');
      if (wrongAnswers != null && wrongAnswers.contains(id.toString())) {
        wrongAnswers.remove(id.toString());
        await prefs.setStringList('wrong_answers', wrongAnswers);
      }
    } else {
      _isCorrect = false;
      List<String>? wrongAnswers = prefs.getStringList('wrong_answers');
      if (wrongAnswers == null) {
        wrongAnswers = [];
        wrongAnswers.add(id.toString());
      } else if (wrongAnswers.contains(id)) {
        wrongAnswers.add(id.toString());
      }
      await prefs.setStringList('wrong_answers', wrongAnswers);
      print(await prefs.getStringList('wrong_answers'));
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
              widget.questionList.questions[widget.index].questionText
                  .split("/")[0],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
              ),
            ),
            Text(
              widget.questionList.questions[widget.index].questionText
                  .split("/")[1],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => _checkAnswer(0),
                child: Column(children: [
                  Text(
                    widget.questionList.questions[widget.index].options[0]
                        .split("/")[0],
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    ),
                  ),
                  Text(
                    widget.questionList.questions[widget.index].options[0]
                        .split("/")[1],
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    ),
                  ),
                ])),
            ElevatedButton(
                onPressed: () => _checkAnswer(1),
                child: Column(children: [
                  Text(
                    widget.questionList.questions[widget.index].options[1]
                        .split("/")[0],
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    ),
                  ),
                  Text(
                    widget.questionList.questions[widget.index].options[1]
                        .split("/")[1],
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    ),
                  ),
                ])),
            ElevatedButton(
                onPressed: () => _checkAnswer(2),
                child: Column(children: [
                  Text(
                    widget.questionList.questions[widget.index].options[2]
                        .split("/")[0],
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    ),
                  ),
                  Text(
                    widget.questionList.questions[widget.index].options[2]
                        .split("/")[1],
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    ),
                  ),
                ])),
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
