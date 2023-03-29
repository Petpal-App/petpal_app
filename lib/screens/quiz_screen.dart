import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../models/question.dart';
import '../screens/category_screen.dart';
import '../widgets/youtube_player.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final QuestionList questionList;
  final int index;
  final double deviceHeight_half;

  QuizScreen({
    required this.category,
    required this.questionList,
    required this.index,
    required this.deviceHeight_half,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool _showModal = false;
  bool _isCorrect = false;

  void _checkAnswer(int selectedIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final id = widget.questionList.questions[widget.index].id.toString();
    if (selectedIndex == 0) {
      _isCorrect = true;
      List<String>? wrongAnswers = prefs.getStringList('wrong_answers');
      if (wrongAnswers != null && wrongAnswers.contains(id)) {
        wrongAnswers.remove(id);
        await prefs.setStringList('wrong_answers', wrongAnswers);
      }
    } else {
      _isCorrect = false;
      List<String>? wrongAnswers = prefs.getStringList('wrong_answers');
      if (wrongAnswers == null) {
        wrongAnswers = [];
      }
      if (!wrongAnswers.contains(id)) {
        wrongAnswers.add(id);
        await prefs.setStringList('wrong_answers', wrongAnswers);
      }
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
              ? (context) => QuizScreen(
                    category: widget.category,
                    questionList: widget.questionList,
                    index: widget.index + 1,
                    deviceHeight_half: widget.deviceHeight_half,
                  )
              : (context) => CategoryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.whiteColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: AppColor.whiteColor,
        foregroundColor: AppColor.blackColor,
        toolbarHeight: MediaQuery.of(context).viewPadding.top,
        elevation: 0,
        title: Text(
          'Quiz - ${widget.category}',
          style: TextStyle(
            color: AppColor.blackColor,
            fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: widget.deviceHeight_half * 0.1),
              child: YoutubePlayerWidget(
                  videoId: widget.questionList.questions[widget.index].videoId),
            ),
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
            SizedBox(height: widget.deviceHeight_half * 0.13),
            Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.whiteColor),
                    foregroundColor:
                        MaterialStateProperty.all(AppColor.blackColor),
                  ),
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
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.fontFamily,
                        ))
                  ]),
                ),
                SizedBox(
                  height: widget.deviceHeight_half * 0.05,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.whiteColor),
                    foregroundColor:
                        MaterialStateProperty.all(AppColor.blackColor),
                  ),
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
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.fontFamily,
                        ))
                  ]),
                ),
                SizedBox(
                  height: widget.deviceHeight_half * 0.05,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.whiteColor),
                    foregroundColor:
                        MaterialStateProperty.all(AppColor.blackColor),
                  ),
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
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.fontFamily,
                        ))
                  ]),
                ),
              ],
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
