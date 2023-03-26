class Question {
  final String questionText;
  final List<String> options;
  final String videoId;
  final String type;

  Question(
      {required this.questionText,
      required this.options,
      required this.videoId,
      required this.type});
}

class QuestionList {
  List<Question> questions;
  int count;

  QuestionList({required this.questions, required this.count});
}
