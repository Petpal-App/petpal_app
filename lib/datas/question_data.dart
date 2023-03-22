import 'package:flutter/material.dart';

import '../models/question.dart';

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

//category에 있던 것들 빼왔어요.