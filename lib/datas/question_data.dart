import 'package:flutter/material.dart';

import '../models/question.dart';

QuestionList dogQuestionList = (new QuestionList(questions: [
  new Question(
    questionText: "영상에서 강아지는 왜 손을 핥을까요?",
    options: ["주인 짱 좋아", "그만하세요", "배고파"],
    type: "dog",
    videoId: "l1zrjrCLCZw",
  ),
  new Question(
    questionText: "강아지는 왜 배를 보여줄까요?",
    options: ["예뻐해주세요", "배고파요", "누구세요?"],
    type: "dog",
    videoId: "V3DWSYcIcjE",
  ),
  new Question(
    questionText: "dog 문제 3",
    options: ["정답", "오답", "오답"],
    type: "dog",
    videoId: "A2-8IDBl6bk",
  ),
], count: 3));

QuestionList catQuestionList = (new QuestionList(questions: [
  new Question(
    questionText: "영상에서 고양이는 뭐라고 말했을까요?",
    options: ["욕", "사랑해", "심심해"],
    type: "cat",
    videoId: "4fbwl4fsnms",
  ),
  new Question(
    questionText: "다음 고양이의 행동은 무엇을 뜻하나요?",
    options: ["화가 나요", "슬퍼요", "사랑해요"],
    type: "cat",
    videoId: "SV9P-JGlB4g",
  ),
  new Question(
    questionText: "cat 문제 3",
    options: ["정답", "오답", "오답"],
    type: "cat",
    videoId: "A2-8IDBl6bk",
  ),
], count: 3));

QuestionList birdQuestionList = (new QuestionList(questions: [
  new Question(
    questionText: "다음 앵무새의 행동은 무엇을 뜻하나요?",
    options: ["궁금해요", "시끄러워요", "보고싶었어요"],
    type: "bird",
    videoId: "xIokGs0Vgh0",
  ),
  new Question(
    questionText: "bird 문제 2",
    options: ["정답", "오답", "오답"],
    type: "bird",
    videoId: "A2-8IDBl6bk",
  ),
  new Question(
    questionText: "bird 문제 3",
    options: ["정답", "오답", "오답"],
    type: "bird",
    videoId: "A2-8IDBl6bk",
  ),
], count: 3));

QuestionList fishQuestionList = (new QuestionList(questions: [
  new Question(
    questionText: "fish 문제 1",
    options: ["정답", "오답", "오답"],
    type: "fish",
    videoId: "A2-8IDBl6bk",
  ),
  new Question(
    questionText: "fish 문제 2",
    options: ["정답", "오답", "오답"],
    type: "fish",
    videoId: "A2-8IDBl6bk",
  ),
  new Question(
    questionText: "fish 문제 3",
    options: ["정답", "오답", "오답"],
    type: "fish",
    videoId: "A2-8IDBl6bk",
  ),
], count: 3));

//category에 있던 것들 빼왔어요.