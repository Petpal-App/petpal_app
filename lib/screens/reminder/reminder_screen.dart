import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/bodylang/bodylang_question_model.dart';
import 'package:petpal_app/widgets/reminder/reminder_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../models/bodylang/bodylang_question.dart';
import '../../widgets/navbar.dart';
import 'reminder_content_screen.dart';

class ReminderScreen extends StatelessWidget {
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
    return FutureBuilder<List<String>>(
        future: _getWrongAnswers(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            List<String> wrongAnswers = snapshot.data!;
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
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
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
                              margin: EdgeInsets.symmetric(
                                  vertical: deviceWidth * 0.025),
                              child: ReminderCard(
                                  type: "dog", wrongAnswers: wrongAnswers)),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            height: deviceWidth * 0.3,
                            width: deviceWidth * 0.4,
                            margin: EdgeInsets.symmetric(
                                vertical: deviceWidth * 0.025),
                            child: ReminderCard(
                                type: "cat", wrongAnswers: wrongAnswers),
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
                              margin: EdgeInsets.symmetric(
                                  vertical: deviceWidth * 0.025),
                              child: ReminderCard(
                                  type: "bird", wrongAnswers: wrongAnswers)),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              height: deviceWidth * 0.3,
                              width: deviceWidth * 0.4,
                              margin: EdgeInsets.symmetric(
                                  vertical: deviceWidth * 0.025),
                              child: ReminderCard(
                                  type: "fish", wrongAnswers: wrongAnswers)),
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
          } else {
            return Text('Loading...');
          }
        });
  }

  Future<List<String>> _getWrongAnswers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wrongAnswers = prefs.getStringList('wrong_answers') ?? [];
    return wrongAnswers;
  }
}
