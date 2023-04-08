import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/question_model.dart';
import '../widgets/reminder_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../models/question.dart';
import '../widgets/navbar.dart';
import '../widgets/reminder_animal.dart';
import '../widgets/reminder_structure.dart';
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
    final deviceHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        56 -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

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
                child: Column(
                  children: [
                    ReminderStructure(
                      deviceHeight: deviceHeight,
                      topic: 'Body Language',
                      fstAnimal: ReminderAnimal(
                          animal: "dog", wrongAnswers: wrongAnswers),
                      sndAnimal: ReminderAnimal(
                          animal: "cat", wrongAnswers: wrongAnswers),
                      trdAnimal: ReminderAnimal(
                          animal: "bird", wrongAnswers: wrongAnswers),
                      fthAnimal: ReminderAnimal(
                          animal: "fish", wrongAnswers: wrongAnswers),
                    ),
                    ReminderStructure(
                      deviceHeight: deviceHeight,
                      topic: 'Training Guide',
                      fstAnimal: ReminderAnimal(
                          animal: "dog", wrongAnswers: wrongAnswers),
                      sndAnimal: ReminderAnimal(
                          animal: "cat", wrongAnswers: wrongAnswers),
                      trdAnimal: ReminderAnimal(
                          animal: "bird", wrongAnswers: wrongAnswers),
                      fthAnimal: ReminderAnimal(
                          animal: "fish", wrongAnswers: wrongAnswers),
                    ),
                  ],
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
