import 'package:flutter/material.dart';

import '../models/training_guide.dart';

final TrainingGuideList trainingGuideList = (new TrainingGuideList(guides: [
  new TrainingGuide(
      id: 1,
      trainingGuideText: "가이드 1",
      options: ["정답", "오답", "오답"],
      videoId: "A2-8IDBl6bk"),
  new TrainingGuide(
      id: 2,
      trainingGuideText: "가이드 2",
      options: ["정답", "오답", "오답"],
      videoId: "A2-8IDBl6bk"),
  new TrainingGuide(
      id: 3,
      trainingGuideText: "가이드 3",
      options: ["정답", "오답", "오답"],
      videoId: "A2-8IDBl6bk")
], count: 3));

//question data의 training 버전
