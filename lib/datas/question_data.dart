import 'package:flutter/material.dart';

import '../models/question.dart';

QuestionList dogQuestionList = (new QuestionList(questions: [
  new Question(
      id: 1,
      questionText: "영상에서 강아지는 왜 손을 핥을까요?",
      options: ["주인 짱 좋아", "그만하세요", "배고파"],
      correctOptionIndex: 1,
      videoId: "l1zrjrCLCZw",
      status: 0),
  new Question(
      id: 2,
      questionText: "강아지는 왜 배를 보여줄까요?",
      options: ["예뻐해주세요", "배고파요", "누구세요?"],
      correctOptionIndex: 0,
      videoId: "V3DWSYcIcjE",
      status: 0),
  new Question(
      id: 3,
      questionText: "dog 문제 3",
      options: ["정답", "오답", "오답"],
      correctOptionIndex: 0,
      videoId: "A2-8IDBl6bk",
      status: 0),
], count: 3));

QuestionList catQuestionList = (new QuestionList(questions: [
  new Question(
      id: 1,
      questionText: "영상에서 고양이는 뭐라고 말했을까요?",
      options: ["욕", "사랑해", "심심해"],
      correctOptionIndex: 0,
      videoId: "4fbwl4fsnms",
      status: 0),
  new Question(
      id: 2,
      questionText: "다음 고양이의 행동은 무엇을 뜻하나요?",
      options: ["화가 나요", "슬퍼요", "사랑해요"],
      correctOptionIndex: 2,
      videoId: "SV9P-JGlB4g",
      status: 0),
  new Question(
      id: 3,
      questionText: "cat 문제 3",
      options: ["정답", "오답", "오답"],
      correctOptionIndex: 0,
      videoId: "A2-8IDBl6bk",
      status: 0),
], count: 3));

QuestionList birdQuestionList = (new QuestionList(questions: [
  new Question(
      id: 1,
      questionText: "다음 앵무새의 행동은 무엇을 뜻하나요?",
      options: ["궁금해요", "시끄러워요", "보고싶었어요"],
      correctOptionIndex: 0,
      videoId: "xIokGs0Vgh0",
      status: 0),
  new Question(
      id: 2,
      questionText: "bird 문제 2",
      options: ["정답", "오답", "오답"],
      correctOptionIndex: 0,
      videoId: "A2-8IDBl6bk",
      status: 0),
  new Question(
      id: 3,
      questionText: "bird 문제 3",
      options: ["정답", "오답", "오답"],
      correctOptionIndex: 0,
      videoId: "A2-8IDBl6bk",
      status: 0),
], count: 3));

QuestionList fishQuestionList = (new QuestionList(questions: [
  new Question(
      id: 1,
      questionText: "fish 문제 1",
      options: ["정답", "오답", "오답"],
      correctOptionIndex: 0,
      videoId: "A2-8IDBl6bk",
      status: 0),
  new Question(
      id: 2,
      questionText: "fish 문제 2",
      options: ["정답", "오답", "오답"],
      correctOptionIndex: 0,
      videoId: "A2-8IDBl6bk",
      status: 0),
  new Question(
      id: 3,
      questionText: "fish 문제 3",
      options: ["정답", "오답", "오답"],
      correctOptionIndex: 0,
      videoId: "A2-8IDBl6bk",
      status: 0),
], count: 3));

//category에 있던 것들 빼왔어요.