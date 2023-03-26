import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../models/question.dart';
import '../widgets/navbar.dart';
import 'reminder_content_screen.dart';
import '../datas/question_data.dart';
import '../widgets/button_content.dart';

class ReminderScreen extends StatelessWidget {
  final QuestionList filteredDogQuestionList = dogQuestionList;
  final QuestionList filteredCatQuestionList = catQuestionList;
  final QuestionList filteredBirdQuestionList = birdQuestionList;
  final QuestionList filteredFishQuestionList = fishQuestionList;

  void moveToReminderScreen({
    required BuildContext context,
    required String type,
    required QuestionList filteredList,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReminderContentScreen(
          category: type,
          questionList: filteredList,
          index: 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

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
          'Reminder',
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Body Language',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: deviceWidth * 0.3,
                    width: deviceWidth * 0.4,
                    margin: EdgeInsets.symmetric(vertical: deviceWidth * 0.025),
                    child: Card(
                      elevation: 5,
                      child: ElevatedButton(
                        onPressed: () => moveToReminderScreen(
                          context: context,
                          type: 'Dogs',
                          filteredList: filteredDogQuestionList,
                        ),
                        child: ButtonContent(
                          type: "Dog",
                          colors: Colors.blue,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.greenTambourineTransparent,
                          side: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: deviceWidth * 0.3,
                    width: deviceWidth * 0.4,
                    margin: EdgeInsets.symmetric(vertical: deviceWidth * 0.025),
                    child: Card(
                      elevation: 5,
                      child: ElevatedButton(
                        onPressed: () => moveToReminderScreen(
                          context: context,
                          type: "Cat",
                          filteredList: filteredCatQuestionList,
                        ),
                        child: ButtonContent(
                          type: "Cat",
                          colors: Colors.lightGreen,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.greenTambourineTransparent,
                          side: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: deviceWidth * 0.3,
                    width: deviceWidth * 0.4,
                    margin: EdgeInsets.symmetric(vertical: deviceWidth * 0.025),
                    child: Card(
                      elevation: 5,
                      child: ElevatedButton(
                        onPressed: () => moveToReminderScreen(
                          context: context,
                          type: 'Bird',
                          filteredList: filteredBirdQuestionList,
                        ),
                        child: ButtonContent(
                          type: "Bird",
                          colors: Colors.orange,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.greenTambourineTransparent,
                          // side: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: deviceWidth * 0.3,
                    width: deviceWidth * 0.4,
                    margin: EdgeInsets.symmetric(vertical: deviceWidth * 0.025),
                    child: Card(
                      elevation: 5,
                      child: ElevatedButton(
                        onPressed: () => moveToReminderScreen(
                          context: context,
                          type: 'Fish',
                          filteredList: filteredFishQuestionList,
                        ),
                        child: ButtonContent(
                          type: "Fish",
                          colors: Colors.purple,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.greenTambourineTransparent,
                          side: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 1,
      ),
    );
  }
}
