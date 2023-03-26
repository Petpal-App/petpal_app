class Question {
  final String questionText;
  final List<String> options;
  final String type;
  final String videoId;
  final int id;

  Question(
      {required this.questionText,
      required this.options,
      required this.type,
      required this.videoId,
      required this.id});
}
