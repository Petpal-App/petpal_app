import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  void _checkAnswer(int selectedIndex) {
    print(selectedIndex);
    if (selectedIndex == 0) {
      _isCorrect = true;
      //문제 기록
    } else {
      _isCorrect = false;
      //문제 기록
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
              widget.questionList.questions[widget.index].questionText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  child: Text(
                      widget.questionList.questions[widget.index].options[0]),
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
                  child: Text(
                      widget.questionList.questions[widget.index].options[1]),
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
                  child: Text(
                      widget.questionList.questions[widget.index].options[2]),
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
                Text(_isCorrect ? "Correct" : "Wrong")
              ]),
            )
          : null,
    );
  }
}
