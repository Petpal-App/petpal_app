class Question {
  final int id;
  final String questionText;
  final List<String> options;
  final String videoId;
  int status;

  Question(
      {required this.id,
      required this.questionText,
      required this.options,
      required this.videoId,
      required this.status});
}

class QuestionList {
  final List<Question> questions;
  final int count;

  QuestionList({required this.questions, required this.count});
}
