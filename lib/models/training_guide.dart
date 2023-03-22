class TrainingGuide {
  final int id;
  final String trainingGuideText;
  final List<String> options;
  final String videoId;

  TrainingGuide(
      {required this.id,
      required this.trainingGuideText,
      required this.options,
      required this.videoId});
}

class TrainingGuideList {
  final List<TrainingGuide> guides;
  final int count;

  TrainingGuideList({required this.guides, required this.count});
}
