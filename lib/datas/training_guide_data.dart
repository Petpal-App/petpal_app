import 'package:flutter/material.dart';

import '../models/training/training_guide.dart';

TrainingGuideList trainingGuideList = (new TrainingGuideList(guides: [
  new TrainingGuide(
      id: 1,
      trainingGuideText: "앉아 훈련",
      options: ["정답", "오답", "오답"],
      videoId: "T4abqHkSK_4"),
  new TrainingGuide(
      id: 2,
      trainingGuideText: "엎드리기 훈련",
      options: ["정답", "오답", "오답"],
      videoId: "NwWhEATNnxs"),
  new TrainingGuide(
      id: 3,
      trainingGuideText: "짖는 강아지 훈련",
      options: ["정답", "오답", "오답"],
      videoId: "D4tQGybiV8o")
], count: 3));

//question data의 training 버전
