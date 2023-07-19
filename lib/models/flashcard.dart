class FlashcardModel {
  final int id;
  final String question;
  final String answer;
  final int collection_id;

  FlashcardModel(
      {required this.id,
      required this.question,
      required this.answer,
      required this.collection_id});

  factory FlashcardModel.fromJson(Map<String, dynamic> json) {
    return FlashcardModel(
        id: json['id'],
        question: json['question'],
        answer: json['answer'],
        collection_id: json['collection_id']);
  }
}
